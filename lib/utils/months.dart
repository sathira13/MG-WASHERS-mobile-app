class MonthSelector {
    static String getMonth(int month) {
        String monthName = "";
        switch(month) {
            case 1: monthName = "JAN"; break;
            case 2: monthName = "FEB"; break;
            case 3: monthName = "MAR"; break;
            case 4: monthName = "APR"; break;
            case 5: monthName = "MAY"; break;
            case 6: monthName = "JUN"; break;
            case 7: monthName = "JUL"; break;
            case 8: monthName = "AUG"; break;
            case 9: monthName = "SEP"; break;
            case 10: monthName = "OCT"; break;
            case 11: monthName = "NOV"; break;
            case 12: monthName = "DEC"; break;
            default: monthName = "INVALID"; break; // This handles any numbers outside 1-12
        }
        return monthName;
    }
}
