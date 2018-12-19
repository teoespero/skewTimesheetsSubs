
select 
	ts.tsEmployeeId,
	te.Fullname,
	subs.tsDate as SubbedOn,
	absentemp.Fullname as AbsentEmp,
	absence.tsDate as Absenton
from tblTimeSheetsDetails subs
inner join
	tblTimesheets ts
	on ts.TimeSheetID = subs.tsTimeSheetID
inner join
	tblTimeSheetsDetails absence
	on subs.xRefSubTSDetailId = absence.TimeSheetDetailID
	and (absence.tsDate != subs.tsDate)
inner join
	tblEmployee te
	on te.EmployeeID = ts.tsEmployeeId
	and ts.tsPayroll in (select PayrollID from tblPayroll where FiscalYear = 2018)
inner join
	tblTimesheets absentee
	on absence.tsTimeSheetID = absentee.TimeSheetID
inner join
	tblEmployee absentemp
	on absentee.tsEmployeeId = absentemp.EmployeeID


select *
from tblTimesheets
where
	tsEmployeeId = 1071
	and tsPayroll = 1406 -- (select * from tblPayroll where FiscalYear = 2018)

select *
from  tblTimeSheetsDetails
where
	tsTimeSheetID in (
		2996042,
		3018054,
		3040022,
		3062229,
		3066522,
		3067696
	) and tsDate = '10/23/2018'

select *
from tblTimeSheetsDetails
where
	TimeSheetDetailID in (4410596, 
4425435)
