SELECT
	S.name AS job_name
    ,CONCAT(
		'EXEC msdb..sp_update_job '
		,'@job_id = ','''',S.job_id,''''
		,', @enabled = 0'
	) AS disable_synatax
	,CONCAT(
		'EXEC msdb..sp_update_job '
		,'@job_id = ','''',S.job_id,''''
		,', @enabled = 1'
	) AS enable_synatax
FROM
    msdb..sysjobs AS S
WHERE
    S.name LIKE '%%'
	AND S.enabled = 1

