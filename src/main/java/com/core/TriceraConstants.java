
/* 

This class contains the constants used in the entire program.

Author: John Paulo Mataac (@cyberpau)
*/
package com.core;

public class TriceraConstants {
    // special request codes:
    public static final int REQUESTCODE_ASK_USER = 1;
    public static final int REQUESTCODE_DOCUMENT_UPLOAD = 500;
    public static final int REQUESTCODE_ADD_3C = 2;
    public static final int REQUESTCODE_ADD_LESSONLEARN = 3;
    public static final int REQUESTCODE_ERROR = 8192;

    // component types based from [seq] columns. Greater than 0 are buttons.
    public static final int SEQ_TEXTFIELD = -1;
    public static final int SEQ_UPLOAD = -2;
    public static final int SEQ_REPORT_BTN = -3;

    // request / response types
    public static final int RESPONSE_TYPE_STRING = 0;
    public static final int RESPONSE_TYPE_TABLE_COL1 = 1;
    public static final int RESPONSE_TYPE_TABLE_COL2 = 2;
    public static final int RESPONSE_TYPE_TABLE_COL3 = 3;
    public static final int RESPONSE_TYPE_TABLE_COL4 = 4;
    public static final int RESPONSE_TYPE_TABLE_COL5 = 5;
    public static final int RESPONSE_TYPE_BAR_COL2 = 6;
    public static final int RESPONSE_TYPE_PIE_COL2 = 7;

    public static final int RESPONSECODE_BTN_YES = -2;
    public static final int RESPONSECODE_BTN_NO = -4;
    public static final int RESPONSECODE_BTN_CANCEL = -8;
    public static final int RESPONSECODE_BTN_MODIFY = -5;
    //public static final int RESPONSECODE_BTN_LESSONLEARN = 32;

    // message constants:
    public static final String CONST_OK = "OK";
    public static final String CONST_YES = "Yes";
    public static final String CONST_NO = "No";
    public static final String CONST_CANCEL = "Cancel";
    public static final String CONST_HELP_CONCERN = "Help me with my Concern";
    public static final String CONST_ADD_LESSON = "Add new Lesson Learn";


    public TriceraConstants(){

    }

}