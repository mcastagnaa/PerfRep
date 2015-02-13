USE PerfRep

--SELECT * FROM vw_AllPerfDataset
--SELECT * FROM vw_AllPerfDY
--SELECT * FROM vw_AllPeersDefs
--SELECT * FROM vw_AllDYFields

--EXEC dbo.spS_GetPerfRawData '2014 Sep 30', 1, null, null
--EXEC dbo.spS_GetPerfRawData_FundsOnly '2012 Nov 30', 1, null, null
--EXEC dbo.spS_GetQuartilePerfData '2013 Mar 31', 1, null, null
--EXEC dbo.spS_GetQuartilePerfDataRaw '2012 Dec 31'
--EXEC dbo.spS_GetQuartileErrors '2013 Apr 30'
--EXEC dbo.spS_GetPerfVsBench '2013 Mar 31', 1, null, null
--EXEC dbo.spS_GetPerfVsPeer '2013 Mar 31', 1, null, null
--EXEC dbo.spS_GetPerfVsObj '2013 Mar 31', 1, null, null
--EXEC dbo.spS_GetPerfAnlyRawData '2012 OCt 31', 1, null, null
--EXEC dbo.spS_GetBchkListForRawData '2012 Aug 31'
--EXEC dbo.spS_GetBchkListSIForRawData '2012 Aug 31'
--EXEC dbo.spS_GetPeerGListForRawData '2012 Dec 31'
--EXEC dbo.spS_GetPeerGListSLMCForRawData '2014 Aug 31'
--EXEC dbo.spS_GetPeerGListSIForRawData '2012 Dec 31'
--EXEC dbo.spS_GetFundsListForRawData '2012 Oct 31', 'IsraelsenVsPeers'
EXEC dbo.spS_GetBchkListSLMCForRawData '2014 Dec 31'

--EXEC dbo.spS_GetScharts1yData '2012 Oct 31'
--EXEC dbo.spS_GetScharts2yData '2012 Oct 31'
--EXEC dbo.spS_GetScharts3yData '2012 Oct 31'
--EXEC dbo.spS_GetScharts5yData '2012 Oct 31'
--EXEC dbo.spS_GetSchartsTable '2012 Oct 31'
--EXEC dbo.spS_GetBonusPoolPerfData '2012 Oct 31'
--EXEC dbo.spS_GetBonusPoolPerfRawData '2013 Mar 31'
--EXEC dbo.spS_GetPerfDataRaw_Finance '2012 Oct 31'
--EXEC dbo.spS_GetPerfDataRaw_Finance6m '2012 Nov 30'
--EXEC spS_GetTCFBenchTest '2013 Apr 30'
--EXEC spS_GetTCFBench '2012 Sep 30'
--EXEC spS_GetTCFPeerTest '2013 Mar 31'
--EXEC spS_GetTCFPeer '2013 Mar 31'
--EXEC spS_GetTCFObj '2013 Oct 31'
--EXEC spS_GetPerf1mDataByFund '2013 Jan 31', 157

--EXEC dbo.spU_StoreCEORepRawData '2014 Aug 31'
--EXEC dbo.spS_GetCEOAuMOverall '2014 Jun 30', null, null
--EXEC dbo.spS_GetCEOPerfAll '2014 Jun 30', null, null
--EXEC dbo.spS_GetCEOPerfDesk '2014 Jan 31', null, null
--EXEC dbo.spS_GetCEOCharts '2014 Jan 31', null, null
--EXEC dbo.spS_GetCEOAuMTrack '2014 Jan 31', null, null
--EXEC spS_GetCEOHistCharts '2014 Jan 31', null


--EXEC dbo.spS_GetAuMsAll '2014 Jan 31', null, null
--EXEC dbo.spS_CheckFinanceAuMData '2013 May 31'

-- THIS HAS BEEN MOVED TO VIVALDI! EXEC dbo.spS_GetDashboardRiskRep '2013 Nov 27', 3
--EXEC dbo.spS_GetDashboardRiskRepSMALL '2013 May 30', 3

--SELECT dbo.fn_GetQuartile(1.01, 1)  -- 0 returns 5, 1 returns NULL

--EXEC spU_StoreNCCFRepRawData
--EXEC dbo.spS_AddedChartsNCCFRep '2013/May/31', 317
--EXEC dbo.spS_ScopeNCCFRep '2013/jun/30'
--EXEC dbo.spS_NCCFRollingStats '2014/Jan/31', 1

--EXEC dbo.spS_GetShortPerfRep '2014/May/31', null, 0, null
--date, SoldAs (null, nvarchar(10)), Select (null,0, 1), Core (null,0, 1)