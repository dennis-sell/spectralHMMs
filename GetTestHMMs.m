P1 = [.4, .6];

TRANS1 = [.8, .2;
             .1, .9];

EMIS1 = [.2, .2, .2, .2, .2;
            .5, .125, .125, .125, .125];
hmm1 = makehmm(P1, TRANS1, EMIS1);
clearvars P1 TRANS1 EMIS1


P2 = [.3, .4, .3];

TRANS2 = [.5, .2, .3;
          .4, .5, .1;
          .2, .4, .4];

EMIS2 = [.15,.15,.15,.20, .20, .15;
         .4, .15, .05, .1, .15, .15;
         .05, .1, .15, .3, .2, .2];

hmm2 = makehmm(P2, TRANS2, EMIS2);
clearvars P2 TRANS2 EMIS2
