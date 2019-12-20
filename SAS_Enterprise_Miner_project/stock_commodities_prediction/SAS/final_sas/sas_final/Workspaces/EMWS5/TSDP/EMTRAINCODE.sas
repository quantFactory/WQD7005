
%macro EM_TSDP_MAIN;

   filename temp catalog 'sashelp.emtsdm.tsdp_macros.source';
   %include temp;
   filename temp catalog 'sashelp.emtsdm.tsutility_macros.source';
   %include temp;
   filename temp;

   %if %upcase(&EM_ACTION) = CREATE %then %do;
       filename temp catalog 'sashelp.emtsdm.tsdp_create.source';
       %include temp;
       filename temp;
       %EM_TSDP_CREATE;
   %end;
   %else
   %if %upcase(&EM_ACTION) = TRAIN %then %do;
        filename temp catalog 'sashelp.emtsdm.tsdp_train.source';
           %include temp;
           filename temp;
       %EM_TSDP_TRAIN;
   %end;
   %else
   %if %upcase(&EM_ACTION) = SCORE %then %do;
        filename temp catalog 'sashelp.emtsdm.tsdp_score.source';
           %include temp;
           filename temp;
       %EM_TSDP_SCORE;
   %end;
   %else
   %if %upcase(&EM_ACTION) = REPORT %then %do;
           filename temp catalog 'sashelp.emtsdm.tsdp_report.source';
           %include temp;
           filename temp;
        %EM_TSDP_REPORT;
   %end;
   %else
     %if %upcase(&EM_ACTION) = OPENTIMETABLEACTION  %then %do;
           filename temp catalog 'sashelp.emtsdm.tsdp_actions.source';
           %include temp;
           filename temp;
        %EM_TSDP_OpenTimeTable ;
   %end;
   %else
   %if %upcase(&EM_ACTION) = CLOSETABLEACTION  %then %do;
          filename temp catalog 'sashelp.emtsdm.tsdp_actions.source';
           %include temp;
           filename temp;
        %EM_TSDP_closeTimeTable ;
   %end;

%mend EM_TSDP_MAIN;
%EM_TSDP_MAIN;


