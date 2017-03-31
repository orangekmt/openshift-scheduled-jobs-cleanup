oc get jobs -n ${DEFAULT_NAMESPACE} > /tmp/jobs
tail -n +2 /tmp/jobs > /tmp/jobs-without-header

while read JOB_WITH_STATS
do
    JOB=$(eval echo "${JOB_WITH_STATS}" | awk '{print $1}')
    SUCCESSFUL_RUN=$(eval echo "${JOB_WITH_STATS}" | awk '{print $3}')

    if [ ${SUCCESSFUL_RUN} == "1" ]; then
      START=`oc get job -n abcd1234 -o yaml | grep -i "startTime:" | awk '{print $2}'`
      START_TIMESTAMP=`date -d "$START" +%s`
      DATE=`date +%s`
      echo "start:" $START_TIMESTAMP
      echo "date:" $DATE
      DURATION=`expr $DATE - $START_TIMESTAMP`
        if [[ $DURATION > $1 ]] ;
          then
            echo "Successfully ended job \"${JOB}\", delete it"
            oc delete job ${JOB} -n ${DEFAULT_NAMESPACE}
          else
            echo "not to delete"
          fi
    else
      echo "\"${JOB}\" not successfully ended"
    fi
done < /tmp/jobs-without-header
