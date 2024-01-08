class Constants
{
  static final  Uri USW1_AWS_POD1_LoginURL = Uri.parse("https://dm-us.informaticacloud.com/ma/api/v2/user/login");

  static final String Export_AllLinkedOrgReport = "public/core/v3/license/metering/ExportMeteringDataAllLinkedOrgsAcrossRegion";
  static final String Check_Job_Status = "public/core/v3/license/metering/ExportMeteringData/";
  static final String Trigger_ServiceReport = "public/core/v3/license/metering/ExportServiceJobLevelMeteringData";

  static final String MeterID_DI = "a2nB20h1o0lc7k3P9xtWS8";


}



enum IPUREPRORTVIEW {

EXPORT_SUMMARY_IPU_USAGE,EXPORT_JOB_LEVEL_IPU_USAGE_FOR_PARTICULAR_SERVICE, NOTHING;
}