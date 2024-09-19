<!-- CSS-Klassen: 

wos

-->

<!-- PHP-Code -->

<?php

use wbb\system\cache\builder\StatsCacheBuilder;
use wcf\system\cache\builder\UserStatsCacheBuilder;
use lexicon\system\cache\builder\StatsCacheBuilder as LexiconStatsCacheBuilder;


use wcf\system\WCF;

WCF::getTPL()->assign([
    'stats' => array_merge(

        LexiconStatsCacheBuilder::getInstance()->getData(),
         UserStatsCacheBuilder::getInstance()->getData(),
        StatsCacheBuilder::getInstance()->getData()
    )
]);

?>

<!-- HTML-Code -->

<p>... <span>{if $scForumOnlineTime|isset}{$scForumOnlineTime}{/if}</span> (Montag, der 19.03.2024, 20:59 Uhr) gegründet.</p>
<p>Seitdem wurden bereits <span>{#$stats[entries]} {if $stats[entries] == 1}{LEXICON_ENTRY_TITLE|language}{else}{LEXICON_ENTRY_TITLE_PL|language}{/if}</span> ({#$stats[entriesPerDay]} {if $stats[entriesPerDay] == 1}{LEXICON_ENTRY_TITLE|language}{else}{LEXICON_ENTRY_TITLE_PL|language}{/if} pro Tag) in die Datenbank eingetragen und dazu</p>
<p>wurden im Forum <span>{#$stats.posts} {if $stats.posts == 1}Beitrag{else}Beiträge{/if}</span> ({#$stats.postsPerDay|round:2} {if  $stats[postsPerDay] == 1}Beitrag{else}Beiträge{/if} pro Tag) in <span>{#$stats.threads} {if $stats[threads] == 1}Thema{else}Themen{/if}</span> verfasst. (Fanclub-Foren nicht mit einberechnet.)</p>