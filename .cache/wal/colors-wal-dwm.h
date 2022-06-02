static const char norm_fg[] = "#c2abe0";
static const char norm_bg[] = "#0C1A1D";
static const char norm_border[] = "#87779c";

static const char sel_fg[] = "#c2abe0";
static const char sel_bg[] = "#A15367";
static const char sel_border[] = "#c2abe0";

static const char urg_fg[] = "#c2abe0";
static const char urg_bg[] = "#3D445F";
static const char urg_border[] = "#3D445F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
