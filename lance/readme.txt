Hacking Lance PT2.3F mod

ORIGINAL CODE BY LANCE
ORIGINALLY MODIFIED BY PAULO SIMOES
AMIGA 2.3F REPLAY BY 8BITBUBSY
VOLUME TABLES FROM PTPLAYER 6.0 BY FRANK WILLE
MODIFIED BY INSANE/RABENAUGE^TSCC

- split into paula+tracker.asm
- removed qmalloc
- moved init code from main to paula
- removed trash buffers
- removed hard bpm (seemed to use trash+timer)
- simple soft bpm emulator added
- LMC modified (bugged sometimes on my STE,volume got suddenly louder)
- merged with current pt2.3f replay
- removed paula init from mt_init, DIY!
- allows loop end detection
- allows visualizer support
- allows master volume
- fixed invert loop (mt_FunkIt)

used in Chipo Django 2 for STE
https://www.pouet.net/prod.php?which=94151

