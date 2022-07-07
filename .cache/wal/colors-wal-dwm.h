static const char norm_fg[] = "#c0caf5";
static const char norm_bg[] = "#11121D";
static const char norm_border[] = "#414868";

static const char sel_fg[] = "#c0caf5";
static const char sel_bg[] = "#9ece6a";
static const char sel_border[] = "#c0caf5";

static const char urg_fg[] = "#c0caf5";
static const char urg_bg[] = "#f7768e";
static const char urg_border[] = "#f7768e";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
