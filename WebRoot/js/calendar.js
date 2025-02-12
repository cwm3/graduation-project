﻿/*
*功能：带有节假日设置的万年历
*作者：www.sucaijiayuan.com
*/
var lunarInfo = new Array(
        0x4bd8, 0x4ae0, 0xa570, 0x54d5, 0xd260, 0xd950, 0x5554, 0x56af, 0x9ad0, 0x55d2,
        0x4ae0, 0xa5b6, 0xa4d0, 0xd250, 0xd255, 0xb54f, 0xd6a0, 0xada2, 0x95b0, 0x4977,
        0x497f, 0xa4b0, 0xb4b5, 0x6a50, 0x6d40, 0xab54, 0x2b6f, 0x9570, 0x52f2, 0x4970,
        0x6566, 0xd4a0, 0xea50, 0x6a95, 0x5adf, 0x2b60, 0x86e3, 0x92ef, 0xc8d7, 0xc95f,
        0xd4a0, 0xd8a6, 0xb55f, 0x56a0, 0xa5b4, 0x25df, 0x92d0, 0xd2b2, 0xa950, 0xb557,
        0x6ca0, 0xb550, 0x5355, 0x4daf, 0xa5b0, 0x4573, 0x52bf, 0xa9a8, 0xe950, 0x6aa0,
        0xaea6, 0xab50, 0x4b60, 0xaae4, 0xa570, 0x5260, 0xf263, 0xd950, 0x5b57, 0x56a0,
        0x96d0, 0x4dd5, 0x4ad0, 0xa4d0, 0xd4d4, 0xd250, 0xd558, 0xb540, 0xb6a0, 0x95a6,
        0x95bf, 0x49b0, 0xa974, 0xa4b0, 0xb27a, 0x6a50, 0x6d40, 0xaf46, 0xab60, 0x9570,
        0x4af5, 0x4970, 0x64b0, 0x74a3, 0xea50, 0x6b58, 0x5ac0, 0xab60, 0x96d5, 0x92e0,
        0xc960, 0xd954, 0xd4a0, 0xda50, 0x7552, 0x56a0, 0xabb7, 0x25d0, 0x92d0, 0xcab5,
        0xa950, 0xb4a0, 0xbaa4, 0xad50, 0x55d9, 0x4ba0, 0xa5b0, 0x5176, 0x52bf, 0xa930,
        0x7954, 0x6aa0, 0xad50, 0x5b52, 0x4b60, 0xa6e6, 0xa4e0, 0xd260, 0xea65, 0xd530,
        0x5aa0, 0x76a3, 0x96d0, 0x4afb, 0x4ad0, 0xa4d0, 0xd0b6, 0xd25f, 0xd520, 0xdd45,
        0xb5a0, 0x56d0, 0x55b2, 0x49b0, 0xa577, 0xa4b0, 0xaa50, 0xb255, 0x6d2f, 0xada0,
        0x4b63, 0x937f, 0x49f8, 0x4970, 0x64b0, 0x68a6, 0xea5f, 0x6b20, 0xa6c4, 0xaaef,
        0x92e0, 0xd2e3, 0xc960, 0xd557, 0xd4a0, 0xda50, 0x5d55, 0x56a0, 0xa6d0, 0x55d4,
        0x52d0, 0xa9b8, 0xa950, 0xb4a0, 0xb6a6, 0xad50, 0x55a0, 0xaba4, 0xa5b0, 0x52b0,
        0xb273, 0x6930, 0x7337, 0x6aa0, 0xad50, 0x4b55, 0x4b6f, 0xa570, 0x54e4, 0xd260,
        0xe968, 0xd520, 0xdaa0, 0x6aa6, 0x56df, 0x4ae0, 0xa9d4, 0xa4d0, 0xd150, 0xf252,
        0xd520);

var solarMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var Gan = new Array("", "", "", "", "", "", "", "", "", "");
var Zhi = new Array("子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥");
var Animals = new Array("鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗", "猪");
var solarTerm = new Array("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
var sTermInfo = new Array(0, 21208, 42467, 63836, 85337, 107014, 128867, 150921, 173149, 195551, 218072, 240693, 263343, 285989, 308563, 331033, 353350, 375494, 397447, 419210, 440795, 462224, 483532, 504758)
var nStr1 = new Array('', '', '', '', '', '', '', '', '', '', '')
var nStr2 = new Array('', '', '', '', ' ')

var jcName0 = new Array('建', '除', '满', '平', '定', '执', '破', '危', '成', '收', '开', '闭');
var jcName1 = new Array('闭', '建', '除', '满', '平', '定', '执', '破', '危', '成', '收', '开');
var jcName2 = new Array('开', '闭', '建', '除', '满', '平', '定', '执', '破', '危', '成', '收');
var jcName3 = new Array('收', '开', '闭', '建', '除', '满', '平', '定', '执', '破', '危', '成');
var jcName4 = new Array('成', '收', '开', '闭', '建', '除', '满', '平', '定', '执', '破', '危');
var jcName5 = new Array('危', '成', '收', '开', '闭', '建', '除', '满', '平', '定', '执', '破');
var jcName6 = new Array('破', '危', '成', '收', '开', '闭', '建', '除', '满', '平', '定', '执');
var jcName7 = new Array('执', '破', '危', '成', '收', '开', '闭', '建', '除', '满', '平', '定');
var jcName8 = new Array('定', '执', '破', '危', '成', '收', '开', '闭', '建', '除', '满', '平');
var jcName9 = new Array('平', '定', '执', '破', '危', '成', '收', '开', '闭', '建', '除', '满');
var jcName10 = new Array('满', '平', '定', '执', '破', '危', '成', '收', '开', '闭', '建', '除');
var jcName11 = new Array('除', '满', '平', '定', '执', '破', '危', '成', '收', '开', '闭', '建');

function jcr(d) {
    var jcrjx;
    if (d == '建') jcrjx = '<span style="vertical-align:middle; margin:1px; font-size:12px"><img src="images/yi.gif"/></span>&nbsp;出行.上任.会友.上书.见工<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;动土.开仓.嫁娶.纳采';
    if (d == '除') jcrjx = '<span style="vertical-align:middle; margin:1px;"><img src="images/yi.gif"/></span>&nbsp;除服.疗病.出行.拆卸.入宅<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;求官.上任.开张.搬家.探病';
    if (d == '满') jcrjx = '<span style="vertical-align:middle; margin:1px;"><img src="images/yi.gif"/></span>&nbsp;祈福.祭祀.结亲.开市.交易<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;服药.求医.栽种.动土.迁移';
    if (d == '平') jcrjx = '<span style="vertical-align:middle; margin:1px;"><img src="images/yi.gif"/></span>&nbsp;祭祀.修填.涂泥.余事勿取<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;移徙.入宅.嫁娶.开市.安葬';
    if (d == '定') jcrjx = '<span style="vertical-align:middle; margin:1px;"><img src="images/yi.gif"/></span>&nbsp;易.立券.会友.签约.纳畜<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;种植.置业.卖田.掘井.造船';
    if (d == '执') jcrjx = '<span style="vertical-align:middle; margin:1px;"><img src="images/yi.gif"/></span>&nbsp;祈福.祭祀.求子.结婚.立约<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;开市.交易.搬家.远行';
    if (d == '破') jcrjx = '<span style="vertical-align:middle; margin:1px;"><img src="images/yi.gif"/></span>&nbsp;求医.赴考.祭祀.余事勿取<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;动土.出行.移徙.开市.修造';
    if (d == '危') jcrjx = '<span style="vertical-align:middle; margin:1px;"><img src="images/yi.gif"/></span>&nbsp;经营.交易.求官.纳畜.动土<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;登高.行船.安床.入宅.博彩';
    if (d == '成') jcrjx = '<span style="vertical-align:middle; margin:1px;"><img src="images/yi.gif"/></span>&nbsp;祈福.入学.开市.求医.成服<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;词讼.安门.移徙';
    if (d == '收') jcrjx = '<span style="vertical-align:middle; margin:1px;"><img src="images/yi.gif"/></span>&nbsp;祭祀.求财.签约.嫁娶.订盟<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;开市.安床.安葬.入宅.破土';
    if (d == '开') jcrjx = '<span style="vertical-align:middle; margin:1px;"><img src="images/yi.gif"/></span>&nbsp;疗病.结婚.交易.入仓.求职<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;安葬.动土.针灸';
    if (d == '闭') jcrjx = '<span style="vertical-align:middle; margin:1px;"><img src="images/yi.gif"/></span>&nbsp;祭祀.交易.收财.安葬<br><br><span style="vertical-align:middle; margin:1px;"><img src="images/ji.gif"/></span>&nbsp;宴会.安床.出行.嫁娶.移徙';
    return(jcrjx);
}

//国历节日  *表示放假日
var sFtv = new Array(
        "0101   ",
        "0106  ",
        "0110  ",

        "0202  ",
        "0204  ",
        "0210  ",
        "0214  ",
        "0221  ",
        "0207  ",

        "0303  ",
        "0308  ",
        "0312  ",
        "0315  ",
        "0321  ",
        "0322  ",
        "0323  ",
        "0324  ",

        "0401  ",
        "0407  ",
        "0422  ",

        "0501            ",
        "0504           ",
        "0505           ",
        "0508           ",
        "0512           ",
        "0515           ",
        "0517          ",
        "0518           ",
        "0519           ",
        "0520           ",
        "0522           ",
        "0523           ",
        "0531           ",

        "0601            ",
        "0605            ",
        "0606           ",
        "0617            ",
        "0623           ",
        "0625            ",
        "0626            ",

        "0701            ",
        "0707            ",
        "0711           ",

        "0801            ",
        "0815            ",

        "0908            ",
        "0909            ",
        "0910           ",
        "0916            ",
        "0917            ",
        "0918            ",
        "0920            ",
        "0927            ",
        "0928           ",

        "1001          ",
        "1002            ",
        "1004            ",
        "1007            ",
        "1008            ",
        "1009            ",
        "1010            ",
        "1015           ",
        "1016            ",
        "1017            ",
        "1022            ",
        "1024           ",
        "1025            ",
        "1026            ",
        "1031            ",

        "1107           ",
        "1108            ",
        "1109            ",
        "1110            ",
        "1112            ",
        "1114            ",
        "1117            ",

        "1201           ",
        "1203            ",
        "1209            ",
        "1210            ",
        "1212            ",
        "1213            ",
        "1220           ",
        "1221            ",
        "1224            ",
        "1225            ",
        "1226           ")
//农历节日  *表示放假日
var lFtv = new Array(
        "0101  ",
        "0102  ",
        "0103  ",
        "0104   ",
        "0105   ",
        "0106    ",
        "0107    ",
        "0105  ",
        "0115   ",
        "0202   ",
        "0219   ",
        "0404   ",
        "0408    ",
        "0505    ",
        "0606    ",
        "0624   ",
        "0707  ",
        "0714   ",
        "0715    ",
        "0730   ",
        "0815  ",
        "0909  ",
        "1001  ",
        "1117   ",
        "1208    ",
        "1223  ",
        "1229  ",
        "0100  ");
//某月的第几个星期几; 5,6,7,8 表示到数第 1,2,3,4 个星期几
var wFtv = new Array(
        "0110  ",
        "0150  ",
        "0121  ",
        "0520  ",
        "0530  ",
        "0630  ",
        "0716  ",
        "0730  ",
        "0932  ",
        "0940  ",
        "1011  ",
        "1144  ")

/*****************************************************************************
 日期计算
 *****************************************************************************/

//====================================== 返回农历 y年的总天数
function lYearDays(y) {
    var i, sum = 348;
    for (i = 0x8000; i > 0x8; i >>= 1) sum += (lunarInfo[y - 1900] & i) ? 1 : 0;
    return(sum + leapDays(y));
}

//====================================== 返回农历 y年闰月的天数
function leapDays(y) {
    if (leapMonth(y)) return( (lunarInfo[y - 1899] & 0xf) == 0xf ? 30 : 29);
    else return(0);
}

//====================================== 返回农历 y年闰哪个月 1-12 , 没闰返回 0
function leapMonth(y) {
    var lm = lunarInfo[y - 1900] & 0xf;
    return(lm == 0xf ? 0 : lm);
}

//====================================== 返回农历 y年m月的总天数
function monthDays(y, m) {
    return( (lunarInfo[y - 1900] & (0x10000 >> m)) ? 30 : 29 );
}

//====================================== 算出农历, 传入日期控件, 返回农历日期控件
//                                       该控件属性有 .year .month .day .isLeap
function Lunar(objDate) {

    var i, leap = 0, temp = 0;
    var offset = (Date.UTC(objDate.getFullYear(), objDate.getMonth(), objDate.getDate()) - Date.UTC(1900, 0, 31)) / 86400000;

    for (i = 1900; i < 2100 && offset > 0; i++) {
        temp = lYearDays(i);
        offset -= temp;
    }

    if (offset < 0) {
        offset += temp;
        i--;
    }

    this.year = i;

    leap = leapMonth(i); //闰哪个月
    this.isLeap = false;

    for (i = 1; i < 13 && offset > 0; i++) {
        //闰月
        if (leap > 0 && i == (leap + 1) && this.isLeap == false) {
            --i;
            this.isLeap = true;
            temp = leapDays(this.year);
        }
        else {
            temp = monthDays(this.year, i);
        }

        //解除闰月
        if (this.isLeap == true && i == (leap + 1)) this.isLeap = false;

        offset -= temp;
    }

    if (offset == 0 && leap > 0 && i == leap + 1)
        if (this.isLeap) {
            this.isLeap = false;
        }
        else {
            this.isLeap = true;
            --i;
        }

    if (offset < 0) {
        offset += temp;
        --i;
    }

    this.month = i;
    this.day = offset + 1;
}

//==============================返回公历 y年某m+1月的天数
function solarDays(y, m) {
    if (m == 1)
        return(((y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0)) ? 29 : 28);
    else
        return(solarMonth[m]);
}
//============================== 传入 offset 返回干支, 0=甲子
function cyclical(num) {
    return(Gan[num % 10] + Zhi[num % 12]);
}

//============================== 阴历属性
function calElement(sYear, sMonth, sDay, week, lYear, lMonth, lDay, isLeap, cYear, cMonth, cDay) {

    this.isToday = false;
    //瓣句
    this.sYear = sYear;   //公元年4位数字
    this.sMonth = sMonth;  //公元月数字
    this.sDay = sDay;    //公元日数字
    this.week = week;    //星期, 1个中文
    //农历
    this.lYear = lYear;   //公元年4位数字
    this.lMonth = lMonth;  //农历月数字
    this.lDay = lDay;    //农历日数字
    this.isLeap = isLeap;  //是否为农历闰月?
    //八字
    this.cYear = cYear;   //年柱, 2个中文
    this.cMonth = cMonth;  //月柱, 2个中文
    this.cDay = cDay;    //日柱, 2个中文

    this.color = '';

    this.lunarFestival = ''; //农历节日
    this.solarFestival = ''; //公历节日
    this.solarTerms = ''; //节气
}

//===== 某年的第n个节气为几日(从0小寒起算)
function sTerm(y, n) {
    var offDate = new Date(( 31556925974.7 * (y - 1900) + sTermInfo[n] * 60000  ) + Date.UTC(1900, 0, 6, 2, 5));
    return(offDate.getUTCDate());
}

//============================== 返回阴历 (y年,m+1月)
function cyclical6(num, num2) {
    if (num == 0) return(jcName0[num2]);
    if (num == 1) return(jcName1[num2]);
    if (num == 2) return(jcName2[num2]);
    if (num == 3) return(jcName3[num2]);
    if (num == 4) return(jcName4[num2]);
    if (num == 5) return(jcName5[num2]);
    if (num == 6) return(jcName6[num2]);
    if (num == 7) return(jcName7[num2]);
    if (num == 8) return(jcName8[num2]);
    if (num == 9) return(jcName9[num2]);
    if (num == 10) return(jcName10[num2]);
    if (num == 11) return(jcName11[num2]);
}
function CalConv2(yy, mm, dd, y, d, m, dt, nm, nd) {
    var dy = d + '' + dd
    if ((yy == 0 && dd == 6) || (yy == 6 && dd == 0) || (yy == 1 && dd == 7) || (yy == 7 && dd == 1) || (yy == 2 && dd == 8) || (yy == 8 && dd == 2) || (yy == 3 && dd == 9) || (yy == 9 && dd == 3) || (yy == 4 && dd == 10) || (yy == 10 && dd == 4) || (yy == 5 && dd == 11) || (yy == 11 && dd == 5)) {
        return '<FONT color=#0000A0>日值岁破 大事不宜</font>';
    }
    else if ((mm == 0 && dd == 6) || (mm == 6 && dd == 0) || (mm == 1 && dd == 7) || (mm == 7 && dd == 1) || (mm == 2 && dd == 8) || (mm == 8 && dd == 2) || (mm == 3 && dd == 9) || (mm == 9 && dd == 3) || (mm == 4 && dd == 10) || (mm == 10 && dd == 4) || (mm == 5 && dd == 11) || (mm == 11 && dd == 5)) {
        return '<FONT color=#0000A0>日值月破 大事不宜</font>';
    }
    else if ((y == 0 && dy == '911') || (y == 1 && dy == '55') || (y == 2 && dy == '111') || (y == 3 && dy == '75') || (y == 4 && dy == '311') || (y == 5 && dy == '95') || (y == 6 && dy == '511') || (y == 7 && dy == '15') || (y == 8 && dy == '711') || (y == 9 && dy == '35')) {
        return '<FONT color=#0000A0>日值上朔 大事不宜</font>';
    }
    else if ((m == 1 && dt == 13) || (m == 2 && dt == 11) || (m == 3 && dt == 9) || (m == 4 && dt == 7) || (m == 5 && dt == 5) || (m == 6 && dt == 3) || (m == 7 && dt == 1) || (m == 7 && dt == 29) || (m == 8 && dt == 27) || (m == 9 && dt == 25) || (m == 10 && dt == 23) || (m == 11 && dt == 21) || (m == 12 && dt == 19)) {
        return '<FONT color=#0000A0>日值杨公十三忌 大事不宜</font>';
    }
    else {
        return 0;
    }
}


function calendar(y, m) {

    var sDObj, lDObj, lY, lM, lD = 1, lL, lX = 0, tmp1, tmp2, lM2,lY2,lD2,tmp3,dayglus,bsg,xs,xs1,fs,fs1,cs,cs1
    var cY, cM, cD; //年柱,月柱,日柱
    var lDPOS = new Array(3);
    var n = 0;
    var firstLM = 0;

    sDObj = new Date(y, m, 1, 0, 0, 0, 0);    //当月一日日期

    this.length = solarDays(y, m);    //公历当月天数
    this.firstWeek = sDObj.getDay();    //公历当月1日星期几

    ////////年柱 1900年立春后为庚子年(60进制36)
    if (m < 2) cY = cyclical(y - 1900 + 36 - 1);
    else cY = cyclical(y - 1900 + 36);
    var term2 = sTerm(y, 2); //立春日期

    ////////月柱 1900年1月小寒以前为 丙子月(60进制12)
    var firstNode = sTerm(y, m * 2) //返回当月「节」为几日开始
    cM = cyclical((y - 1900) * 12 + m + 12);

    lM2 = (y - 1900) * 12 + m + 12;
    //当月一日与 1900/1/1 相差天数
    //1900/1/1与 1970/1/1 相差25567日, 1900/1/1 日柱为甲戌日(60进制10)
    var dayCyclical = Date.UTC(y, m, 1, 0, 0, 0, 0) / 86400000 + 25567 + 10;

    for (var i = 0; i < this.length; i++) {

        if (lD > lX) {
            sDObj = new Date(y, m, i + 1);    //当月一日日期
            lDObj = new Lunar(sDObj);     //农历
            lY = lDObj.year;           //农历年
            lM = lDObj.month;          //农历月
            lD = lDObj.day;            //农历日
            lL = lDObj.isLeap;         //农历是否闰月
            lX = lL ? leapDays(lY) : monthDays(lY, lM); //农历当月最后一天

            if (n == 0) firstLM = lM;
            lDPOS[n++] = i - lD + 1;
        }

        //依节气调整二月分的年柱, 以立春为界
        if (m == 1 && (i + 1) == term2) {
            cY = cyclical(y - 1900 + 36);
            lY2 = (y - 1900 + 36);
        }
        //依节气月柱, 以「节」为界
        if ((i + 1) == firstNode) {
            cM = cyclical((y - 1900) * 12 + m + 13);
            lM2 = (y - 1900) * 12 + m + 13;
        }
        //日柱
        cD = cyclical(dayCyclical + i);
        lD2 = (dayCyclical + i);

        this[i] = new calElement(y, m + 1, i + 1, nStr1[(i + this.firstWeek) % 7],
                lY, lM, lD++, lL,
                cY, cM, cD);


        this[i].sgz5 = CalConv2(lY2 % 12, lM2 % 12, (lD2) % 12, lY2 % 10, (lD2) % 10, lM, lD - 1, m + 1, cs1);
        this[i].sgz3 = cyclical6(lM2 % 12, (lD2) % 12);


    }

    //节气
    tmp1 = sTerm(y, m * 2) - 1;
    tmp2 = sTerm(y, m * 2 + 1) - 1;
    this[tmp1].solarTerms = solarTerm[m * 2];
    this[tmp2].solarTerms = solarTerm[m * 2 + 1];
    if (m == 3) this[tmp1].color = 'red'; //清明颜色

    //国历节日
    for (i  in  sFtv)
        if (sFtv[i].match(/^(\d{2})(\d{2})([\s\*])(.+)$/))
            if (Number(RegExp.$1) == (m + 1)) {
                this[Number(RegExp.$2) - 1].solarFestival += RegExp.$4 + '  '
                if (RegExp.$3 == '*')  this[Number(RegExp.$2) - 1].color = 'red'
            }


    //农历节日
    for (i  in  lFtv)
        if (lFtv[i].match(/^(\d{2})(.{2})([\s\*])(.+)$/)) {
            tmp1 = Number(RegExp.$1) - firstLM
            if (tmp1 == -11)  tmp1 = 1
            if (tmp1 >= 0 && tmp1 < n) {
                tmp2 = lDPOS[tmp1] + Number(RegExp.$2) - 1
                if (tmp2 >= 0 && tmp2 < this.length) {
                    this[tmp2].lunarFestival += RegExp.$4 + '  '
                    if (RegExp.$3 == '*')  this[tmp2].color = 'red'
                }
            }
        }

    //复活节只出现在3或4月
    if (m == 2 || m == 3) {
        var estDay = new easter(y);
        if (m == estDay.m)
            this[estDay.d - 1].solarFestival = this[estDay.d - 1].solarFestival + '';
    }


    //黑色星期五
    if ((this.firstWeek + 12) % 7 == 5)
        this[12].solarFestival += '';

    //今日
    if (y == tY && m == tM) this[tD - 1].isToday = true;
}

//======================================= 返回该年的复活节(春分后第一次满月周后的第一主日)
function easter(y) {

    var term2 = sTerm(y, 5); //取得春分日期
    var dayTerm2 = new Date(Date.UTC(y, 2, term2, 0, 0, 0, 0)); //取得春分的公历日期控件(春分一定出现在3月)
    var lDayTerm2 = new Lunar(dayTerm2); //取得取得春分农历

    if (lDayTerm2.day < 15) //取得下个月圆的相差天数
        var lMlen = 15 - lDayTerm2.day;
    else
        var lMlen = (lDayTerm2.isLeap ? leapDays(y) : monthDays(y, lDayTerm2.month)) - lDayTerm2.day + 15;

    //一天等于 1000*60*60*24 = 86400000 毫秒
    var l15 = new Date(dayTerm2.getTime() + 86400000 * lMlen); //求出第一次月圆为公历几日
    var dayEaster = new Date(l15.getTime() + 86400000 * ( 7 - l15.getUTCDay() )); //求出下个周日

    this.m = dayEaster.getUTCMonth();
    this.d = dayEaster.getUTCDate();

}
//======================  中文日期
function cDay(d) {
  var s;

    switch (d) {
        case  10:
            s = '';  break;
        case  20:
            s = '';  break;
           break;
       case  30:
            s = '';  break;
           break;
       default  :
            s = nStr2[Math.floor(d / 10)];
            s += nStr1[d % 10];
    }
    return(s);
}
var cld;
//存放节假日
var hDays = [];
function drawCld(SY, SM) {

    var i,sD,s,size;
    cld = new calendar(SY, SM);


    //$("#GZ")[0].innerHTML = '';

    for (i = 0; i < 42; i++) {
        sObj = $("#SD" + i)[0];

        lObj = $("#LD" + i)[0];

        sObj.className = '';

        sD = i - cld.firstWeek;

        if (sD > -1 && sD < cld.length) {  //日期内
            sObj.innerHTML = sD + 1;
            //wly 注册点击事件
						$("#GD" + i).unbind('click').click(function(){mOck(this,sD + 1);});
						var nowDays = SY+''+addZ((SM+1))+addZ((sD+1));
						var hstr = hDays.join();
						if(hstr.indexOf(nowDays)>-1){
							 $("#GD" + i).addClass("selday");
							}
            if (cld[sD].isToday)  $("#GD" + i).addClass("jinri");  //今日颜色

            sObj.style.color = cld[sD].color;  //国定假日颜色

            if (cld[sD].lDay == 1)  //显示农历月
               lObj.innerHTML = '<b>' + (cld[sD].isLeap ? '闰' : '')+ '' + (monthDays(cld[sD].lYear, cld[sD].lMonth) == 29 ? '' : '') + '</b>';
            else  //显示农历日
                lObj.innerHTML = cDay(cld[sD].lDay);

            s = cld[sD].lunarFestival;
            if (s.length > 0) {  //农历节日
                if (s.length > 8)  s = s.substr(0, 5) + '...';
                s = s.fontcolor('red');
            }
            else {  //国历节日
                s = cld[sD].solarFestival;
                if (s.length > 0) {
                    if (s.length > 8)  s = s.substr(0, 5) + '...';
                    s = (s == '黑色星期五') ? s.fontcolor('black') : s.fontcolor('#0066FF');
                }
                else {  //廿四节气
                    s = cld[sD].solarTerms;
                    if (s.length > 0)  s = s.fontcolor('limegreen');
                }
            }
            if (cld[sD].solarTerms == '清明') s = '清明节'.fontcolor('red');
            if (cld[sD].solarTerms == '芒种') s = '芒种'.fontcolor('red');
            if (cld[sD].solarTerms == '夏至') s = '夏至'.fontcolor('red');
            if (cld[sD].solarTerms == '冬至') s = '冬至'.fontcolor('red');

            if (s.length > 0)  lObj.innerHTML = s;

        }
        else {  //非日期
            $("#GD" + i).addClass("unover");

        }
    }
}


/*清除数据*/
function clear() {
    for (i = 0; i < 42; i++) {
        sObj = $("#SD" + i)[0];
        sObj.innerHTML = '';
        lObj = $("#LD" + i)[0];
        lObj.innerHTML = '';
        $("#GD" + i).removeClass("unover");
        $("#GD" + i).removeClass("jinri");
        $("#GD" + i).removeClass("selday");

    }

}


var Today = new Date();
var tY = Today.getFullYear();
var tM = Today.getMonth();

var tD = Today.getDate();
//////////////////////////////////////////////////////////////////////////////

var width = "130";
var offsetX = 2;
var offsetY = 18;

var x = 0;
var y = 0;
var snow = 0;
var sw = 0;
var cnt = 0;
var dStyle;


// 将农历iLunarMonth月格式化成农历表示的字符串
function FormatLunarMonth(iLunarMonth) {
    var szText = new String("正二三四五六七八九十");
    var strMonth;
    if (iLunarMonth <= 10) {
        strMonth = szText.substr(iLunarMonth - 1, 1);
    }
    else if (iLunarMonth == 11) strMonth = "十一";
    else strMonth = "十二";
    return strMonth + "月";
}
// 将农历iLunarDay日格式化成农历表示的字符串
function FormatLunarDay(iLunarDay) {
    var szText1 = new String("初十廿三");
    var szText2 = new String("一二三四五六七八九十");
    var strDay;
    if ((iLunarDay != 20) && (iLunarDay != 30)) {
        strDay = szText1.substr((iLunarDay - 1) / 10, 1) + szText2.substr((iLunarDay - 1) % 10, 1);
    }
    else if (iLunarDay != 20) {
        strDay = szText1.substr(iLunarDay / 10, 1) + "";
    }
    else {
        strDay = " ";
    }
    return strDay;
}
//显示详细日期资料
function mOvr(thisObj, v) {
    var s,festival,jy;

    sObj = $("#SD" + v);
    var d = sObj.html() - 1;

    if (sObj.html() != '') {
        if (cld[d].sgz5 != 0) {

            jy = cld[d].sgz5;
        } else {
            jy = jcr(cld[d].sgz3);

        }

        var arr = [];
        if (cld[d].solarTerms == '' && cld[d].solarFestival == '' && cld[d].lunarFestival == '')

            arr.push('<div id="teshu"></div>');
        else
        arr.push('<div id="teshu"><FONT  COLOR="#ff0000"  STYLE="font-size:12px;">' + cld[d].solarTerms + ' ' + cld[d].solarFestival + ' ' + cld[d].lunarFestival + '</FONT></div>');

        arr.push('<div style="width:65px; height:30px; color:#666666; float:left; font-size:60px; text-align:center;">' + cld[d].sDay + '</div>');
        arr.push('<font color="black" style="font-weight:bold;font-size:13px;">    ' + cld[d].sYear + '' + cld[d].sMonth + '' + cld[d].sDay + '</font>');
        arr.push('<font style="font-size:12px;line-height:28px"><b>' + '星期' + cld[d].week + '</b></font><br>');
        arr.push('<font style="font-size:12px;color:#000000;" >农历' + (cld[d].isLeap ? '闰' : ' ') + FormatLunarMonth(cld[d].lMonth) + FormatLunarDay(cld[d].lDay) + '</font>');
        arr.push('<font style="font-size:12px">&nbsp;&nbsp;' + cld[d].cYear + ' ' + cld[d].cMonth + '' + cld[d].cDay + '</font><br><br>');
        arr.push('<div style="width:95%; height:70px; margin-top:30px; padding-top:8px; border-top:1px solid #CCCCCC; margin-left:auto; margin-right:auto;">' + jy + '</div>');

        //thisObj.style.backgroundColor = '#fbfbad';
        var d = $(thisObj);
        var pos = d.offset();
        var t = pos.top + d.height() + 5; // 弹出框的上边位置
        var l = pos.left + d.width() - 150;  // 弹出框的左边位置


        <!--

        var winWidth = 0;

        var winHeight = 0;

        function findDimensions() {

            // 获取窗口宽度

            if (window.innerWidth)

                winWidth = window.innerWidth;

            else if ((document.body) && (document.body.clientWidth))

                winWidth = document.body.clientWidth;

            // 获取窗口高度

            if (window.innerHeight)

                winHeight = window.innerHeight;

            else if ((document.body) && (document.body.clientHeight))

                winHeight = document.body.clientHeight;

            // 通过深入 Document 内部对 body 进行检测，获取窗口大小

            if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth) {

                winHeight = document.documentElement.clientHeight;

                winWidth = document.documentElement.clientWidth;

            }

            // 结果输出至两个文本框


        }

        findDimensions();

        // 调用函数，获取数值

        window.onresize = findDimensions;

        //-->
        /* alert("h:"+winHeight+"w:"+winWidth)*/

        if (winHeight - pos.top < 230) {
            t = pos.top + d.height() - 180;
            l = pos.left + d.width() + 5;

        }

        if (winWidth - pos.left < 350) {

            t = pos.top + d.height() - 180;
            l = pos.left + d.width() - 360;

            if (pos.top < 216) {
                t = pos.top + d.height() - 100;
                l = pos.left + d.width() - 360;
            }
        }


        $("#details").addClass("pop");
        $("#details").css({ "top": t, "left": l }).show();
        $("#details").html(arr.join(""));


        if (snow == 0) {

            snow = 1;

        }


    }
}
//------王立岩------start------
//日期点击函数
function mOck(thisObj, v){
	var onoff = thisObj.attributes["on"].value;

	var dayContainer = thisObj.getElementsByTagName("font")[0];

	//记录是否为周末
	var lx='0';
	var nian = $('#nian').text();
	var yue = $('#yue').text();
	var dayJson = "";
	var day = dayContainer.innerHTML;
	var dayColor = dayContainer.attributes["color"];
	var dayF = nian+'/'+addZ(yue)+'/'+addZ(day);
	if(dayColor&&dayColor.value=='red'&&getH(dayF)){
		 lx = '1';
	}
	dayJson = '{holiday:'+nian+addZ(yue)+addZ(day)+',lx:'+lx+'}';
	if(onoff == '0'){
		thisObj.style.background='#FBBB67';
		thisObj.setAttribute("class", "selday"); 
		thisObj.attributes["on"].value='1';
		hDays.push(dayJson);
   }else{
   	thisObj.style.background='';
   	thisObj.setAttribute("class", "");
   	thisObj.attributes["on"].value='0';
   	delArry(hDays,dayJson);
	}
}
//删除数组指定元素
function delArry(arr,obj){
	for (var i = arr.length - 1; i > -1; i--) { 
        if (arr[i] == obj) { 
            arr.splice(i, 1);//参数（删除的元素下标，从该下标起删除几个元素）
       }
      }
}
//去重数组
function delMoreArry(){
	var newArray = [],
      temp = {};
  for(var i = 0; i < this.length; i++){
           temp[typeof(this[i])+this[i]] = this[i];
      }
  for(var j in temp){
           newArray.push(temp[j]);
     }
 return newArray;
}
function addZ(obj){
	 return obj<10?'0'+obj:obj;
	}
function getH(obj){
	 var d = new Date(Date.parse(obj));
	 var c=d.getDay();
	 if(c==0||c==6){
	 	 return true;
	 	}else{
	 	return false;	
	 	}
	}
//------王立岩------end---
//清除详细日期资料
function mOut(thisObj) {

 //   thisObj.style.backgroundColor = '';
    if (cnt >= 1) {
        sw = 0
    }
    if (sw == 0) {
        snow = 0;
        document.getElementById("details").style.display = 'none';
    }
    else  cnt++;
}


/*初始化日期*/

$(function() {
    initRiliIndex();
    clear();
    $("#nian").html(tY);
    $("#yue").html(tM + 1);
    drawCld(tY, tM);

    /*年份递减*/
    $("#nianjian").click(function() {
        dateSelection.goPrevYear();

    });
    /*年份递加*/
    $("#nianjia").click(function() {
        dateSelection.goNextYear();

    });

    /*月份递减*/
    $("#yuejian").click(function() {

        dateSelection.goPrevMonth();
    });

    /*月份递加*/
    $("#yuejia").click(function() {
        dateSelection.goNextMonth();

    });


});


var global = {
    currYear : -1, // 当前年
    currMonth : -1, // 当前月，0-11
    currDate : null, // 当前点选的日期
    uid : null,
    username : null,
    email : null,
    single : false
    // 是否为独立页调用，如果是值为日历id，使用时请注意对0的判断，使用 single !== false 或者 single === false
};

var dateSelection = {
    currYear : -1,
    currMonth : -1,

    minYear : 1901,
    maxYear : 2100,

    beginYear : 0,
    endYear : 0,

    tmpYear : -1,
    tmpMonth : -1,

    init : function(year, month) {
        if (typeof year == 'undefined' || typeof month == 'undefined') {
            year = global.currYear;
            month = global.currMonth;
        }
        this.setYear(year);
        this.setMonth(month);
        this.showYearContent();
        this.showMonthContent();
    },
    show : function() {
        document.getElementById('dateSelectionDiv').style.display = 'block';
    },
    hide : function() {
        this.rollback();
        document.getElementById('dateSelectionDiv').style.display = 'none';
    },
    today : function() {
        var today = new Date();
        var year = today.getFullYear();
        var month = today.getMonth();

        if (this.currYear != year || this.currMonth != month) {
            if (this.tmpYear == year && this.tmpMonth == month) {
                this.rollback();
            } else {
                this.init(year, month);
                this.commit();
            }
        }
    },
    go : function() {
        if (this.currYear == this.tmpYear && this.currMonth == this.tmpMonth) {
            this.rollback();
        } else {
            this.commit();
        }
        this.hide();
    },
    goToday : function() {
        this.today();
        this.hide();
    },
    goPrevMonth : function() {
        this.prevMonth();
        this.commit();
    },
    goNextMonth : function() {
        this.nextMonth();
        this.commit();
    },
    goPrevYear : function() {
        this.prevYear();
        this.commit();
    },
    goNextYear : function() {
        this.nextYear();
        this.commit();
    },
    changeView : function() {
        global.currYear = this.currYear;
        global.currMonth = this.currMonth;
        clear();
        $("#nian").html(global.currYear);
        $("#yue").html(parseInt(global.currMonth) + 1);
        drawCld(global.currYear, global.currMonth);


    },
    commit : function() {
        if (this.tmpYear != -1 || this.tmpMonth != -1) {
            // 如果发生了变化
            if (this.currYear != this.tmpYear
                    || this.currMonth != this.tmpMonth) {
                // 执行某操作
                this.showYearContent();
                this.showMonthContent();
                this.changeView();


            }

            this.tmpYear = -1;
            this.tmpMonth = -1;
        }
    },
    rollback : function() {
        if (this.tmpYear != -1) {
            this.setYear(this.tmpYear);
        }
        if (this.tmpMonth != -1) {
            this.setMonth(this.tmpMonth);
        }
        this.tmpYear = -1;
        this.tmpMonth = -1;
        this.showYearContent();
        this.showMonthContent();
    },
    prevMonth : function() {
        var month = this.currMonth - 1;
        if (month == -1) {
            var year = this.currYear - 1;
            if (year >= this.minYear) {
                month = 11;
                this.setYear(year);
            } else {
                month = 0;
            }
        }
        this.setMonth(month);
    },
    nextMonth : function() {
        var month = this.currMonth + 1;
        if (month == 12) {
            var year = this.currYear + 1;
            if (year <= this.maxYear) {
                month = 0;
                this.setYear(year);
            } else {
                month = 11;
            }
        }
        this.setMonth(month);
    },
    prevYear : function() {
        var year = this.currYear - 1;
        if (year >= this.minYear) {
            this.setYear(year);
        }
    },
    nextYear : function() {
        var year = this.currYear + 1;
        if (year <= this.maxYear) {
            this.setYear(year);
        }
    },
    prevYearPage : function() {
        this.endYear = this.beginYear - 1;
        this.showYearContent(null, this.endYear);
    },
    nextYearPage : function() {
        this.beginYear = this.endYear + 1;
        this.showYearContent(this.beginYear, null);
    },
    selectYear : function() {//杨：select
        var selectY = $('select[@name="SY"] option[@selected]').text();
        this.setYear(selectY);
        this.commit();
    },
    selectMonth : function() {
        var selectM = $('select[@name="SM"] option[@selected]').text();
        this.setMonth(selectM - 1);
        this.commit();
    },
    setYear : function(value) {
        if (this.tmpYear == -1 && this.currYear != -1) {
            this.tmpYear = this.currYear;
        }
        $('#SY' + this.currYear).removeClass('curr');
        this.currYear = value;
        $('#SY' + this.currYear).addClass('curr');
    },
    setMonth : function(value) {
        if (this.tmpMonth == -1 && this.currMonth != -1) {
            this.tmpMonth = this.currMonth;
        }
        $('#SM' + this.currMonth).removeClass('curr');
        this.currMonth = value;
        $('#SM' + this.currMonth).addClass('curr');
    },
    showYearContent : function(beginYear, endYear) {
        if (!beginYear) {
            if (!endYear) {
                endYear = this.currYear + 1;
            }
            this.endYear = endYear;
            if (this.endYear > this.maxYear) {
                this.endYear = this.maxYear;
            }
            this.beginYear = this.endYear - 3;
            if (this.beginYear < this.minYear) {
                this.beginYear = this.minYear;
                this.endYear = this.beginYear + 3;
            }
        }
        if (!endYear) {
            if (!beginYear) {
                beginYear = this.currYear - 2;
            }
            this.beginYear = beginYear;
            if (this.beginYear < this.minYear) {
                this.beginYear = this.minYear;
            }
            this.endYear = this.beginYear + 3;
            if (this.endYear > this.maxYear) {
                this.endYear = this.maxYear;
                this.beginYear = this.endYear - 3;
            }
        }

        var s = '';
        for (var i = this.beginYear; i <= this.endYear; i++) {
            s += '<span id="SY' + i
                    + '" class="year" onclick="dateSelection.setYear(' + i
                    + ')">' + i + '</span>';
        }
        document.getElementById('yearListContent').innerHTML = s;
        $('#SY' + this.currYear).addClass('curr');
    },
    showMonthContent : function() {
        var s = '';
        for (var i = 0; i < 12; i++) {
            s += '<span id="SM' + i
                    + '" class="month" onclick="dateSelection.setMonth(' + i
                    + ')">' + (i + 1).toString() + '</span>';
        }
        document.getElementById('monthListContent').innerHTML = s;
        $('#SM' + this.currMonth).addClass('curr');
    },
    //根据节假日去相关的月份
	 goHoliday : function(N){
		this.setMonth(N);
		this.commit();
	}
};
function initRiliIndex() {
    var dateObj = new Date();
    global.currYear = dateObj.getFullYear();
    global.currMonth = dateObj.getMonth();

    dateSelection.init();

}