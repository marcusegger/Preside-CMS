<cfscript>
	object              = rc.object ?: ""
	id                  = rc.id ?: ""
	objectTitleSingular = translateResource( uri="preside-objects.#object#:title.singular", defaultValue=object ?: "" );
	recordHistoryTitle  = translateResource( uri="cms:datamanager.recordhistory.title", data=[ prc.record.label ?: "unknown", LCase( objectTitleSingular ) ] );

	prc.pageIcon  = "history";
	prc.pageTitle = recordHistoryTitle;
</cfscript>

<cfoutput>
	#renderView( view="/admin/datamanager/_objectDataTable", args={
		  objectName    = object
		, gridFields    = [ "datemodified", "label" ]
		, datasourceUrl = event.buildAdminLink( linkTo="ajaxProxy", queryString="object=#object#&id=#id#&action=dataManager.getRecordHistoryForAjaxDataTables&gridFields=datemodified,label" )
	} )#
</cfoutput>