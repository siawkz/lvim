local M = {}

M.dashboard = function()
  math.randomseed(os.time())
  local headers = {
    {
      [[                                                _.--"""""--._          ]],
      [[                                             ,-'             `-.       ]],
      [[                  _                        ,' --- -  ----   --- `.     ]],
      [[                ,'|`.                    ,'       ________________`.   ]],
      [[               O`.+,'O                  /        /____(_______)___\ \  ]],
      [[      _......_   ,=.         __________;   _____  ____ _____  _____  : ]],
      [[    ,'   ,--.-`,,;,:,;;;;;;;///////////|   -----  ---- -----  -----  | ]],
      [[   ( SSt(  ==)=========================|      ,---.    ,---.    ,.   | ]],
      [[    `._  `--'-,``````"""""""\\\\\\\\\\\:     /`. ,'\  /_    \  /\/\  ; ]],
      [[       ``````                           \    :  Y  :  :-'-. :  : ): /  ]],
      [[                                         `.  \  |  /  \=====/  \/\/'   ]],
      [[                                           `. `-'-'    `---'    ;'     ]],
      [[                                             `-._           _,-'       ]],
      [[                                                 `--.....--'   ,--.    ]],
      [[                                                              ().0()   ]],
      [[                                                               `'-'    ]],
      [[ (25-Oct-01)                                                           ]],
    },
    {
      [[                                     ,-.._ _                                      ]],
      [[ "But at the last the king          _.`-.,' `;-.._                                ]],
      [[ grew weary, and Morgoth      _..-''    \',-''-.._``--.._                         ]],
      [[ bore down his shield upon  <    ;\\)\   \`.,'`.  ``--.._``-.._    \.             ]],
      [[ him. Thrice he was crushed  \   `.`,'.   \ \   `.     ,'/,'/._``-..\\            ]],
      [[ to his knees, and thrice     \   ,\'  \   \ \    \  ;' '. /,/ ``-.._``-._        ]],
      [[ arose again and bore up his   \  \ \   `.  \ \    \/ \`._' /        `\\``'       ]],
      [[ broken shield and stricken     \  \ \ ,'/`. \ \    \  /`-`/           \'         ]],
      [[ helm..."                        \  `-:  _.'``--\    \/_ ,'                       ]],
      [[         ____         __...--...__`...-;'  ..-   \    `.`.                        ]],
      [[      ,''    ```----''  .-      _..--''          :      \ `.                      ]],
      [[    ,'    _.             _..--''     /  /    ,'  ;.     ;\  \                     ]],
      [[   / ,' ,'     __...--'''  .--..__..'.,'        /: `--'/  \` :                    ]],
      [[  : /      _.''    _             .-\`.`.,'      \ `._,;   :  |                    ]],
      [[  |      ,'   _.-''   _..-           '`,`.,-'    `._.' \ ,|_.''>.     _..--.      ]],
      [[  :     /'..-'   _.-''               -' `.\   _..-'   `_.-')  / ;  _.'   ,-.'     ]],
      [[   \`  /   )_.-''    __..----..   -      ' :,'     _.-'`-'' _;-',' _   ,' )       ]],
      [[    \ :    \      ,''   _            ,'    ;   _.-'  __..-'_._,',-'.-     `-'\    ]],
      [[     \:     `._,-'                        / ,-'_..-'' \ ,`',', )-'.-''  -.__.'    ]],
      [[      `\_ `.   `.._         ,-'     ___  (,'.-'        ;-.(<`,'.<`-'.        `-,  ]],
      [[         `.    ,'  `.'_)`.,'      ,(   `,'           ,'   \`' `-.`'   _. `  .-'   ]],
      [[           `-,'  ,'_.'   \)    _.' \\   \      _.-../      `.     _.-'   ,'`-.._  ]],
      [[           ,'  , ,'   `-. `--''     \\   \    /`    \\ ._`,' >_.-'   `-    _ _.-` ]],
      [[         ,'  ,','`-..___             \\   \  ,`.    ,`:.,'_.''  `-._     ' _`.    ]],
      [[ /`. _.-' `-.,'   __    ``.    -.._   \`.  \'  ,) ,:   /)''`,       `-..-'' `'    ]],
      [[_) ,'-.`.`._)`-.__) `-.    `-._        `. _ \,' `' ;        >                     ]],
      [[   ),-'`''             `..__)`.`-.   _..:,-.:      \        `,___,.               ]],
      [[                               `-'`-`-''|,-.|-..`.__`._ -.._ )___' \              ]],
      [[                                    SSt  )_,'         ``-'`--`'````.'..__,._.-'`. ]],
      [[                                         |/                                       ]],
    },
    {
      [[                                             _______________________       ]],
      [[   _______________________-------------------                       `\     ]],
      [[ /:--__                                                              |     ]],
      [[||< > |                                   ___________________________/     ]],
      [[| \__/_________________-------------------                         |       ]],
      [[|                                                                  |       ]],
      [[ |                       THE LORD OF THE RINGS                      |      ]],
      [[ |                                                                  |      ]],
      [[ |      "Three Rings for the Elven-kings under the sky,             |      ]],
      [[  |        Seven for the Dwarf-lords in their halls of stone,        |     ]],
      [[  |      Nine for Mortal Men doomed to die,                          |     ]],
      [[  |        One for the Dark Lord on his dark throne                  |     ]],
      [[  |      In the Land of Mordor where the Shadows lie.                 |    ]],
      [[   |       One Ring to rule them all, One Ring to find them,          |    ]],
      [[   |       One Ring to bring them all and in the darkness bind them   |    ]],
      [[   |     In the Land of Mordor where the Shadows lie.                |     ]],
      [[  |                                              ____________________|_    ]],
      [[  |  ___________________-------------------------                      `\  ]],
      [[  |/`--_                                                                 | ]],
      [[  ||[ ]||                                            ___________________/  ]],
      [[   \===/___________________--------------------------                      ]],
    },
    {
      [[                                                ]],
      [[                                          _.oo. ]],
      [[                  _-u[[/;:,.         .odMMMMMM' ]],
      [[               .o888UU[[[/;:-.. .o@P^    MMM^   ]],
      [[              oN88888UU[[[/;::-..       dP^     ]],
      [[             dNMMNN888UU[[[/;:--..  .o@P^       ]],
      [[            ,MMMMMMN888UU[[/;::-..o@^           ]],
      [[            NNMMMNN888UU[[[/~.o@P^              ]],
      [[            888888888UU[[[/o@^-...              ]],
      [[           oI8888UU[[[/o@P^:--....              ]],
      [[        .@^  YUU[[[/o@^;::---....               ]],
      [[      oMP     ^/o@P^;:::---....                 ]],
      [[   .dMMM    .o@^ ^;::---.....                   ]],
      [[  dMMMMMMM@^`       `^^^^^                      ]],
      [[ YMMMUP^                                        ]],
      [[                                                ]],
      [[                                                ]],
      [[                                                ]],
    },
    {
      "",
      "",
      "",
      "",
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⡠⡄⠰⡀⡤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⢰⠂⠇⠑⠀⠈⠈⠈⠫⠈⡼⡄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡤⠒⠊⠀⠀⠀⠈⠀⢀⢀⢀⣄⡠⠂⡱⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⣾⣿⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠲⠩⠁⡁⠠⠀⠀⠠⠂⠀⠀⣾⣿⡆⠀⠠⡋⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⠀⠀⣿⣿⣾⣿⡄⠀⠀⠀⠀⠀⣸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⣆⣠⠀⢀⣤⣀⠀⠀⠀⠈⣏⡆⠂⠀⠠⠐⠁⡨⣠⡥⢺⣿⣿⣷⠀⠀⠠⣊⡀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⢸⣿⣾⠀⠀⣤⠀⠀⣿⣿⣧⠀⠀⡇⠀⠀⠀⠀⠀⠀⣿⣿⣿⣼⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⢈⣶⣾⠀⠀⠀⠀⠀⠀⣤⣧⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⢠⣼⣄⠀⣿⣿⠀⢸⣿⡇⠀⠀⠀⢈⣿⣧⠠⠀⢀⠂⣴⣮⠺⡧⣼⣿⣿⣿⡄⠐⢖⢚⠐⠰⠆⢠⣀⣿⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⢹⣿⣿⠀⢰⣿⣶⣷⣿⣿⣿⣾⣾⣿⠀⠀⢸⡆⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠈⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⠦⠴⠦⠴⠦⠶⠴⠤⠴⠤⢾⣿⣿⠀⣿⣿⣠⣼⣿⡇⠀⠀⠀⠀⣰⣿⣶⣶⣶⣶⣿⡇⡄⢃⣿⣿⣿⣿⣷⣶⣷⣶⠀⠀⠀⠀⠈⣿⠢⡀⠀⠀⠀]],
      [[⠀⣶⡆⠀⢰⣶⢺⣿⣿⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⣹⣇⣡⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡇⠀⢰⣾⠀⣿⣿⣿⣿⣷⣶⣤⡟⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡏⣑⣿⣿⣿⣿⣿⣿⠀⢀⡀⠀⣸⣿⣿⣿⣿⣿⣿⣇⡃⢸⣿⣿⣿⣿⣿⣿⣿⣿⣤⣤⣄⣠⣄⣿⠀⠐⡂⠀⠀]],
      [[⠠⣿⣿⣿⣿⣿⣾⣿⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢀⣠⣄⡀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣼⢄⠀]],
      [[⢈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢹⣿⣿⣿⣿⣿⣿⣿⣿⠉⠛⢻⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⡄]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    },
    {
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣺⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣟⣺⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠭⠭⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢀⡂⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣬⣤⣤⣵⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠯⠽⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣲⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⠀⠀⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⢠⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣿⣿⣿⣸⡀⠀⠀⠀⠄⠀⠀⡀⠀⠀⠀⠀]],
      [[⠀⠀⢀⣤⠀⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣇⣀⣀⣸⣿⣆⠀⠀⠀⢼⣿⣿⣿⣿⣿⣿⣿⣿⡅⠀⠀⢸⣿⣿⣿⡇⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀⣰⡀⠀⢸⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⢠⡄⠀⠀⠀⠀⠀⠀⠀⠀⣀⣿⣿⣿⣿⣿⣿⣷⣀⠀⠰⡷⠀⣠⣷⡀⠀⠀⠀]],
      [[⣀⡀⢸⣿⠀⠀⠀⠀⠀⢠⣾⣿⡇⣇⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⢸⣿⣿⡿⠛⠻⣿⣿⣿⡇⠀⠀⢸⣿⣿⣿⡇⠀⠀⣶⣶⣿⣿⣶⣶⠀⡇⠀⢸⣿⣿⡆⢸⠀⠀⠀⣿⣿⣇⣀⣀⣀⣠⣼⣧⣆⣀⣀⣀⡀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⡇⢠⣿⣿⣷⡀⠀⠀]],
      [[⣿⡇⢸⣿⠀⠀⣤⣦⣴⣼⣿⣿⡇⣧⣾⣿⣀⠀⠀⢠⣿⣿⠟⡏⠉⠉⢙⡻⢿⣿⣄⣆⢸⣿⣿⣇⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡏⠙⡿⢿⣆⣷⣤⣼⣿⣿⣧⣼⣤⣄⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣀⣇⣸⣿⣿⣿⣇⣀⣀]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣴⣴⣿⣿⣷⣾⣿⣦⣶⣼⣷⣾⣻⣿⣿⣿⣿⣿⣿⣧⣤⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⡇⠀⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣷⣶⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    },
    {
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⢀⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⢀⣀⣠⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⢸⣿⣿⢀⣠⣤⣴⣶⡇⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⣀⣿⡀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⢰⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣴⣶⠀]],
      [[⣼⣿⣿⣾⣿⣿⣿⣿⡇⠀⠀⢀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⢀⡀⣀⣀⣀⣀⣀⣹⣿⣿⣿⣁⣀⣀⣀⡀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⠀⠀⠀⠀⠀⠀⣀⡀⠀⣿⡇⢸⣿⣿⣿⣿⣿⠀⣴⣦⣾⠀⠀⣀⠀⣿⣿⣿⣿⠀]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣧⢀⣶⣾⣷⣶⣶⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣶⣀⡀⠀⠀⠀⢀⣀⣠⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣄⠀⠀⣶⣿⣿⣿⡇⠀⣿⡇⢸⣿⣿⣿⣿⣿⢀⣿⣿⣿⠀⣿⣿⣇⣿⣿⣿⣿⠀]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⣠⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⢸⠀⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⣿⣿⣿⣿⣧⡀⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⣿⣿⣿⣿⣿⣿⣿⠀]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⣿⣿⣿⣿⠀⠀⢀⣀⣀⣀⠀⣿⡏⠉⢹⡯⠉⠉⣿⠉⠉⠉⠉⣿⡏⠉⢹⡏⠉⠉⣿⠀⢰⣾⣿⣿⣶⠀⠀⠀⣿⣿⣿⣿⡇⡄⣿⣿⣿⣿⣿⣧⣿⣧⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⠀]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣿⣿⣿⣿⣆⡀⢸⣿⣿⣿⠀⣿⡇⠀⢸⡧⠀⠀⣿⠀⠀⠀⠀⣿⡇⠀⢸⡇⠀⠀⣿⠀⢸⣿⣿⣿⣿⠀⣤⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⡇⠀⢸⣯⠀⠀⣿⠀⠀⠀⠀⣿⡇⠀⢸⡇⠀⠀⣿⠀⢸⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⡇⠀⢸⡷⠀⠀⣿⠀⠀⠀⠀⣿⡇⠀⢸⡇⠀⠀⣿⣤⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣤⣼⣿⣤⣤⣿⣤⣤⣤⣤⣿⣧⣤⣼⣧⣤⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
      [[⠛⠛⠛⠛⠛⠙⠋⠋⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠋⠛⠛⠛⠙⠋⠛⠛⠋⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛]],
    },
    {
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⡿⢿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣧⣼⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢿⣿⣿⣿⢿⣿⣿⣿⣿⡿⣿⣿⣿⡿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣾⣶⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣷⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢿⣿⡿⡆⠀⠀⠀⠀⠀⠀⠀⠰⢿⣿⡿⡗⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣶⣦⡀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⣴⣶⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣾⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⢴⣿⣿⣿⣷⠄⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⢠⣿⢿⣿⣿⣿⣿⣿⣿⡿⠛⠛⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣯⢸⣿⡇⢸⣿⡇⣹⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡟⠛⢿⣿⠀⠀⠀⠀⠀⠀⠀⢸⣿⠋⢻⣿⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⢸⢻⣼⣿⡿⠿⡟⠀⢸⡇⠀⠀⣿⣿⣿⣀⣠⣤⡀⠀⠀⠀⠀⠀⢀⣀⣀⡀⣀⠀⠀⠀⣾⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⡿⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⢸⣿⡿⠉⡇⠀⡇⣀⣸⣧⣶⣶⣿⣿⣿⣿⣿⣿⣷⣤⣤⣼⣿⣤⣾⣿⣿⣿⣿⡟⢻⣷⣿⣿⡏⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⡇⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣶⣾⣿⣤⣤⣤⣤⣤⣤⣤⣼⣿⣶⣾⣿⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⣾⢟⢀⣀⣧⣶⣿⣿⣿⣿⠿⢿⣿⡿⠋⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡿⠿⢿⣿⣿⣿⣟⣯⣿⣿⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⢹⣽⣿⣿⡿⢿⡟⠉⢻⡇⠀⢰⣿⡇⠀⠀⣿⣿⣿⡇⠀⢿⣿⠁⠀⢹⣿⣇⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣽⣿⣿⣯⣽⣿⣿⣿⣿⣯⣽⣿⣿⣯⣽⣿⣿⣽⣿⣿⣿⣭⣿⣿⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣏⡇⠀⢸⡙⣿⣿⣿⣿⣷⣿⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⣾⡟⡏⢸⠀⢸⡇⠀⢸⣇⣀⣸⣿⣧⣤⣴⣿⣿⣿⣷⣶⣾⣿⣤⣤⣼⣿⣿⡆⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣥⣤⣤⣤⣤⣤⣤⣤⣤⣤⣬⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⣿⣇⣇⣼⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⡟⢻⣿⣿⡟⢻⣿⡟⢻⣿⡟⣿⣿⣿⡟⢻⣿⣿⢻⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡿⢿⡿⠿⣿⡿⠛⠻⣿⡟⠉⠙⢿⣿⠋⠉⠙⣿⣿⡟⠛⢻⣿⡿⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣼⣿⣿⣧⣼⣿⣧⣼⣿⣧⣿⣿⣿⣧⣾⣿⣿⣼⣿⣿⣿⣧⣿⣿⣴⢹⣿⣿⣿⡿⠿⢿⣿⣿⣿⡏⣿⣿⢻⣿⣿⣿⣿⡏⠉⢹⣿⣿⣿⣿⡟⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⣿⡏⡇⢸⠀⢸⡇⠀⢸⡇⠀⠀⣿⡇⠀⠀⣿⣿⠀⠀⠀⣿⣿⣷⡀⢰⣿⡆⠀⠐⣿⡇⠀⢹⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⡏⠀⢸⣿⣶⣾⡿⢻⣿⠀⠀⢸⣿⠟⣿⣗⣿⣿⣾⣿⣿⣿⣿⡇⠀⢸⣿⣿⣿⣿⣷⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⢀⣿⣇⣇⣸⣀⣸⣇⣀⣸⣇⣀⣀⣿⣇⣀⣀⣿⣿⣀⣀⣀⣿⣿⣿⣧⣸⣿⣇⣀⣀⣿⣿⣄⣸⣿⣿⣏⣿⣿⡇⠀⣿⣿⡟⢹⣿⡇⢸⣿⡟⣿⣿⣿⡇⢸⣿⣿⣹⣿⣿⡇⠀⢸⣿⣿⣿⡇⠀⣿⠀⠀⢸⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣤⣼⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀]],
      [[⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄]],
      [[⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠁]],
    },
    {
      "",
      "",
      "",
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⣶⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⢲⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠘⢹⡯⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣶⣦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣶⣶⣤⣤⣄⣀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⣶⠀⠀⠀⢸⡇⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⣀⣤⣴⣶⣾⣿⣿⣿⣿⣿⣿⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⣿⠀⠀⠀⢹⡏⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⣿⡆⠀⢠⣼⡇⠀⠀⠀⠀⠀⠸⣿⣿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣥⣀⡀⢀⣀⣤⣤⣶⣶⣾⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣀⠀⢀⢤⡤⡀⠀⣀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⣿⣿⣿⣿⣿⡇⠀⢀⣠⣤⣶⣾⣿⣷⣶⣤⣀⣘⣿⢹⣿⠋⠉⠛⠛⠛⣿⢹⣿⣿⣿⡿⠛⠛⠛⠿⠿⣿⡿⠿⠿⠿⠛⠛⢿⣿⣿⣿⠃⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢀⡦⡭⠽⠓⠊⠉⠉⠉⠉⠉⠈⠑⠒⠸⢿⣀⠀⠀⢀⠀⠀⠀⠀⠀]],
      [[⣿⣿⣿⣿⣿⣿⣀⠀⣟⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣤⣤⣽⣼⣿⣿⣭⣤⣤⣤⣤⣤⣤⣼⣤⣤⣤⣤⣤⣤⣤⣽⣿⣧⣤⣤⣽⣅⣀⡀⠘⣿⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⣠⣤⣧⢤⠀⠀⠀⣐⣢⣷⣄⣆⣉⣁⣀⣀⣄⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣄⣈⣀⣰⣪⣪⣔⣢⡄⠀]],
      [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣾⣿⣿⣿⣿⣿⣿⣶⣶⣿⣶⣶⣶⡶⡶⣿⣶⣶⣶⣶⢶⣶⣶⡶⣶⡶⣾⢿⣿⣿⡿⣿⡿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣤⣿⣿⣿⣿⡏⠉⠉⠰⠘⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣠⣮⣄⡀]],
      [[⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿]],
    },
    {
      "                                                              ",
      "    ⢀⣀⣤⣤⣤⠤⢤⣤⣤⣤⣤⣄⣀⡀           ⢀⣠⣤⣄⡀            ⣀⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⡀   ",
      " ⢀⣤⠚⠩⠁⡄ ⠠⣤⠒⠒⣂ ⢈⣨⣭⣿⠛⠶⣦⣤⣄⡀   ⢠⣾⡟⠉⠉⠝⠿⠇    ⢀⣠⡤⠔⠒⣻⠟⠋⠩⠉⢁⣀⡀  ⣶  ⠙⡛⠷  ",
      " ⠸⢟⡠⠒⢊⡤  ⠋⣠ ⠈⣉⣉⣉⣉⣀⣛⣿⡒⠭⡿⢿⣷⣤⣤⣀⣽⣇⣴⠆⣴⡃⢀⣠⣤⠴⣚⣫⡥ ⠒⠛⠁⣀⣉⣉⣙⢏⡉  ⢀⣼⣤⣜⠳⡦⠂  ",
      "   ⠐⠚⠫⣤⠖⢣⣤⡕ ⠉⣩⣤⠔ ⠂⣋⣭⣥⣤⠴⠛⣛⠈⢩⣿⠿⠛⢉  ⡐⠞⠫⢍⠙⣓⠢⠴⣥⣍⣙⠛⢓⡢⢤⣬⠉⠅ ⣤⡜⢛⠻⠛⠉⠁   ",
      "      ⠘⢔⢎⣡⡔⠂⣠⡿⠁⠒⢛⡻⢛⣩⠅  ⠉  ⠚⣯⣄⢠⣿⢀⣾⠇ ⠓ ⠁⠂⠈⠍⠐⠈⡉⣿⠛⣛⠛⠉⣤⣰⣿⣿⡟⠛⠁      ",
      "        ⠙⠛⠐⠚⠋ ⠒⣲⡿⠇⣋        ⢺⡏⠈⣀ ⠉⠈        ⠙⢿⠟⢰⣖⡢ ⠂⠒⠚⠉         ",
      "             ⣴⠛⠅⢀⣾⠟⢃       ⢹⠃⠠⠁⠈⠩         ⢠⣿ ⣀⢹⣿⡷             ",
      "             ⢿⣤⢚⣫⠅         ⢸⠇ ⢚ ⢀         ⣸⡇ ⠉⣿⣿⠇             ",
      "             ⠈⠛⢻⣥⡚⠔⣠⢣⣄⡀    ⢸⡇ ⢘ ⠈ ⠠⠈    ⣀⣰⡿⣧⣄⠾⠋⠁              ",
      "                ⠈⠑⠁        ⠘⣿⡀⣈⣀    ⠈  ⠈⠙⠁                    ",
      "                            ⠘⣷⠁                               ",
      "                             ⠙⣤                               ",
      "                              ⠛⠂                              ",
      "                                                              ",
    },
    {
      "                   ██          ██                    ",
      "                 ██▒▒██      ██▒▒██                  ",
      "                 ██▒▒▓▓██████▓▓▒▒██                  ",
      "               ██▓▓▒▒▒▒▓▓▓▓▓▓▒▒▒▒▓▓██                ",
      "               ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                ",
      "             ██▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓██              ",
      "             ██▒▒▒▒██▒▒▒▒██▒▒▒▒██▒▒▒▒██              ",
      "             ██▒▒▒▒▒▒▒▒██▒▒██▒▒▒▒▒▒▒▒██              ",
      "           ██▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓██            ",
      "           ██▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓██            ",
      "           ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██            ",
      "           ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██            ",
      "         ██▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██          ",
      "         ██▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓██          ",
      "         ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    ████  ",
      "         ██▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██  ██▒▒▒▒██",
      "         ██▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓██    ██▓▓██",
      "         ██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒██    ██▒▒██",
      "         ██▓▓▒▒▒▒██▒▒██▒▒▒▒▒▒██▒▒██▒▒▒▒▓▓██████▒▒▒▒██",
      "           ██▓▓▒▒██▒▒██▒▒▒▒▒▒██▒▒██▒▒▓▓██▒▒▒▒▓▓▒▒██  ",
      "             ██████▒▒██████████▒▒████████████████    ",
      "                 ██████      ██████                  ",
    },
    {
      "",
      "",
      "",
      "",
      "   ▄████▄        ▒▒▒▒▒    ▒▒▒▒▒    ▒▒▒▒▒    ▒▒▒▒▒ ",
      "  ███▄█▀        ▒ ▄▒ ▄▒  ▒ ▄▒ ▄▒  ▒ ▄▒ ▄▒  ▒ ▄▒ ▄▒",
      " ▐████  █  █    ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒",
      "  █████▄        ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒",
      "    ████▀       ▒ ▒ ▒ ▒  ▒ ▒ ▒ ▒  ▒ ▒ ▒ ▒  ▒ ▒ ▒ ▒",
      "",
      "",
      "",
      "",
    },
    {
      [[]],
      [[     ___                                    ___     ]],
      [[    /__/\          ___        ___          /__/\    ]],
      [[    \  \:\        /__/\      /  /\        |  |::\   ]],
      [[     \  \:\       \  \:\    /  /:/        |  |:|:\  ]],
      [[ _____\__\:\       \  \:\  /__/::\      __|__|:|\:\ ]],
      [[/__/::::::::\  ___  \__\:\ \__\/\:\__  /__/::::| \:\]],
      [[\  \:\~~\~~\/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/]],
      [[ \  \:\  ~~~  \  \:\|  |:|     \__\::/  \  \:\      ]],
      [[  \  \:\       \  \:\__|:|     /__/:/    \  \:\     ]],
      [[   \  \:\       \__\::::/      \__\/      \  \:\    ]],
      [[    \__\/           ~~~~                   \__\/    ]],
      [[]],
    },
    {
      [[      ____                                        ]],
      [[     /___/\_                                      ]],
      [[    _\   \/_/\__                     __           ]],
      [[  __\       \/_/\            .--.--.|__|.--.--.--.]],
      [[  \   __    __ \ \           |  |  ||  ||        |]],
      [[ __\  \_\   \_\ \ \   __      \___/ |__||__|__|__|]],
      [[/_/\\   __   __  \ \_/_/\                         ]],
      [[\_\/_\__\/\__\/\__\/_\_\/                         ]],
      [[   \_\/_/\       /_\_\/                           ]],
      [[      \_\/       \_\/                             ]],
    },
    {
      [[          |  \ \ | |/ /                     ]],
      [[          |  |\ `' ' /                      ]],
      [[          |  ;'aorta \      / , pulmonary   ]],
      [[          | ;    _,   |    / / ,  arteries  ]],
      [[ superior | |   (  `-.;_,-' '-' ,           ]],
      [[vena cava | `,   `-._       _,-'_           ]],
      [[          |,-`.    `.)    ,<_,-'_, pulmonary]],
      [[         ,'    `.   /   ,'  `;-' _,  veins  ]],
      [[        ;        `./   /`,    \-'           ]],
      [[        | right   /   |  ;\   |\            ]],
      [[        | atrium ;_,._|_,  `, ' \           ]],
      [[        |        \    \ `       `,          ]],
      [[        `      __ `    \   left  ;,         ]],
      [[         \   ,'  `      \,  ventricle       ]],
      [[          \_(            ;,      ;;         ]],
      [[          |  \           `;,     ;;         ]],
      [[ inferior |  |`.          `;;,   ;'         ]],
      [[vena cava |  |  `-.        ;;;;,;'          ]],
      [[          |  |    |`-.._  ,;;;;;'           ]],
      [[          |  |    |   | ``';;;'  FL         ]],
      [[                  aorta                     ]],
    },
    {
      [[            ___           _,.---,---.,_                                 ]],
      [[            |         ,;~'             '~;,                             ]],
      [[            |       ,;                     ;,                           ]],
      [[   Frontal  |      ;                         ; ,--- Supraorbital Foramen]],
      [[    Bone    |     ,'                         /'                         ]],
      [[            |    ,;                        /' ;,                        ]],
      [[            |    ; ;      .           . <-'  ; |                        ]],
      [[            |__  | ;   ______       ______   ;<----- Coronal Suture     ]],
      [[           ___   |  '/~"     ~" . "~     "~\'  |                        ]],
      [[           |     |  ~  ,-~~~^~, | ,~^~~~-,  ~  |                        ]],
      [[ Maxilla,  |      |   |        }:{        | <------ Orbit               ]],
      [[Nasal and  |      |   l       / | \       !   |                         ]],
      [[Zygomatic  |      .~  (__,.--" .^. "--.,__)  ~.                         ]],
      [[  Bones    |      |    ----;' / | \ `;-<--------- Infraorbital Foramen  ]],
      [[           |__     \__.       \/^\/       .__/                          ]],
      [[              ___   V| \                 / |V <--- Mastoid Process      ]],
      [[              |      | |T~\___!___!___/~T| |                            ]],
      [[              |      | |`IIII_I_I_I_IIII'| |                            ]],
      [[     Mandible |      |  \,III I I I III,/  |                            ]],
      [[              |       \   `~~~~~~~~~~'    /                             ]],
      [[              |         \   .       . <-x---- Mental Foramen            ]],
      [[              |__         \.    ^    ./                                 ]],
      [[                            ^~~~^~~~^                                   ]],
    },
    {
      [[ _____                                 ]],
      [[/     \                                ]],
      [[vvvvvvv  /|__/|                        ]],
      [[   I   /O,O   |                        ]],
      [[   I /_____   |      /|/|              ]],
      [[  J|/^ ^ ^ \  |    /00  |    _//|      ]],
      [[   |^ ^ ^ ^ |W|   |/^^\ |   /oo |      ]],
      [[    \m___m__|_|    \m_m_|   \mm_|      ]],
      [[                                       ]],
      [[  "Totoros" (from "My Neighbor Totoro")]],
      [[      --- Duke Lee                     ]],
      [[]],
    },
    {
      [[]],
      [[ ...      (^~^)                              ]],
      [[(°з°)  _ ┐__\|_┌________ __   __ ___ __   __ ]],
      [[|  |  | |       |       |  | |  |   |  |_|  |]],
      [[|   |_| |    ___|  ___  |  |_|  |   |       |]],
      [[|       |   |___| |▀-▀| |       |   |       |]],
      [[|  _    |    ___| |___| |       |   |       |]],
      [[| | |   |   |___|       ||     ||   | ||_|| |]],
      [[|_|  |__|_______|_______| |___| |___|_|   |_|]],
      [[]],
      [[]],
    },
  }
  return headers[math.random(1, #headers)]
end

return M
