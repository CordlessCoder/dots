const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#11121D", /* black   */
  [1] = "#f7768e", /* red     */
  [2] = "#9ece6a", /* green   */
  [3] = "#e0af68", /* yellow  */
  [4] = "#7aa2f7", /* blue    */
  [5] = "#bb9af7", /* magenta */
  [6] = "#7dcfff", /* cyan    */
  [7] = "#a9b1d6", /* white   */

  /* 8 bright colors */
  [8]  = "#414868",  /* black   */
  [9]  = "#f7768e",  /* red     */
  [10] = "#9ece6a", /* green   */
  [11] = "#e0af68", /* yellow  */
  [12] = "#7aa2f7", /* blue    */
  [13] = "#bb9af7", /* magenta */
  [14] = "#7dcfff", /* cyan    */
  [15] = "#c0caf5", /* white   */

  /* special colors */
  [256] = "#11121D", /* background */
  [257] = "#c0caf5", /* foreground */
  [258] = "#f7768e",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
