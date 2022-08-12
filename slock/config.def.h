/* user and group to drop privileges to */
static const char *user  = "tuilk";
static const char *group = "tuilk";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#4dabf7",   /* during input */
	[FAILED] = "#ff8787",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;
