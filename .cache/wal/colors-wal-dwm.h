static const char norm_fg[] = "#DEDEDE";
static const char norm_bg[] = "#252525";
static const char norm_border[] = "#3B3B3B";

static const char sel_fg[] = "#DEDEDE";
static const char sel_bg[] = "#70B433";
static const char sel_border[] = "#DEDEDE";

static const char urg_fg[] = "#DEDEDE";
static const char urg_bg[] = "#ED4A46";
static const char urg_border[] = "#ED4A46";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
