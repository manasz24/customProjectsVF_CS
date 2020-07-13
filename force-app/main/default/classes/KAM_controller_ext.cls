public with sharing class KAM_controller_ext {
    
    public String currentRecordId {get; set;}
    //public String currentRecord{get; set;}
    public String Obj {get; set;}
    

    public KAM_controller_ext(ApexPages.StandardController stdCtrl) {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
        //currentRecord = ApexPages.CurrentPage().getparameters().get('Name');
    }


    public pageReference newObjcreate(){
        system.debug(currentRecordId);
        system.debug('string' + Obj);
        sObject sobj = schema.getGlobalDescribe().get(Obj).newSObject();
        system.debug(sobj);
        Schema.sObjectType one = sobj.getSObjectType();
        String keyPrefix_result = one.getDescribe().getKeyPrefix();
        //String keyPrefix_result = MSD_CORE_Trend_and_Differ__c.SObjectType.getDescribe().getKeyPrefix();
        system.debug(keyPrefix_result);
        pageReference pageRef = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/'+ keyPrefix_result +'/e?'); 
        pageRef.getParameters().put('MSD_CORE_Account__c',currentRecordId);
        //pageRef.setRedirect(true);
        return pageRef;

    }



    

}
