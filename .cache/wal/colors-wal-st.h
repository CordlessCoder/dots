const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#252525", /* black   */
  [1] = "#ED4A46", /* red     */
  [2] = "#70B433", /* green   */
  [3] = "#DBB32D", /* yellow  */
  [4] = "#368AEB", /* blue    */
  [5] = "#EB6EB7", /* magenta */
  [6] = "#3FC5B7", /* cyan    */
  [7] = "#777777", /* white   */

  /* 8 bright colors */
  [8]  = "#3B3B3B",  /* black   */
  [9]  = "#FF5E56",  /* red     */
  [10] = "#83C746", /* green   */
  [11] = "#EFC541", /* yellow  */
  [12] = "#4F9CFE", /* blue    */
  [13] = "#FF81CA", /* magenta */
  [14] = "#56D8C9", /* cyan    */
  [15] = "#DEDEDE", /* white   */

  /* special colors */
  [256] = "#181818", /* background */
  [257] = "#b9b9b9", /* foreground */
  [258] = "#B9B9B9",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
