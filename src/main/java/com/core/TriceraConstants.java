package com.core;

public class TriceraConstants {
    // special request codes:
    public static final int REQUESTCODE_ASK_USER = 0;
    public static final int REQUESTCODE_SEARCH_3C = 1;
    public static final int REQUESTCODE_ADD_3C = 2;
    public static final int REQUESTCODE_ADD_LESSONLEARN = 3;
    public static final int REQUESTCODE_RESTART = 100;

    // response codes to generate inputLayout components (bit-wise):
    public static final int RESPONSECODE_TF = 1;
    public static final int RESPONSECODE_BTN_YES = 2;
    public static final int RESPONSECODE_BTN_NO = 4;
    public static final int RESPONSECODE_BTN_CANCEL = 8;
    public static final int RESPONSECODE_BTN_3C = 16;
    public static final int RESPONSECODE_BTN_LESSONLEARN = 32;

    // message constants:
    public static final String CONST_YES = "Yes";
    public static final String CONST_NO = "No";
    public static final String CONST_CANCEL = "Cancel";
    public static final String CONST_HELP_CONCERN = "Help me with my Concern";
    public static final String CONST_ADD_LESSON = "Add new Lesson Learn";


    public TriceraConstants(){

    }

}