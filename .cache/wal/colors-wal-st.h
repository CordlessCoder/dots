const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0C1A1D", /* black   */
  [1] = "#3D445F", /* red     */
  [2] = "#A15367", /* green   */
  [3] = "#2E3893", /* yellow  */
  [4] = "#5F4EA7", /* blue    */
  [5] = "#5347A9", /* magenta */
  [6] = "#955EAD", /* cyan    */
  [7] = "#c2abe0", /* white   */

  /* 8 bright colors */
  [8]  = "#87779c",  /* black   */
  [9]  = "#3D445F",  /* red     */
  [10] = "#A15367", /* green   */
  [11] = "#2E3893", /* yellow  */
  [12] = "#5F4EA7", /* blue    */
  [13] = "#5347A9", /* magenta */
  [14] = "#955EAD", /* cyan    */
  [15] = "#c2abe0", /* white   */

  /* special colors */
  [256] = "#0C1A1D", /* background */
  [257] = "#c2abe0", /* foreground */
  [258] = "#c2abe0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
