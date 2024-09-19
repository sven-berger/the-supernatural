<!-- PHP-Code BEGINN -->

<?php

use wbb\system\cache\builder\StatsCacheBuilder;
use wcf\system\cache\builder\UserStatsCacheBuilder;
use wcf\system\WCF;

WCF::getTPL()->assign([
    'statistics' => array_merge(
        UserStatsCacheBuilder::getInstance()->getData(),
        StatsCacheBuilder::getInstance()->getData()
    )
]);

?>

<!-- Template-Code -->

<ul class="inlineList dotSeparated">
<li>{#$statistics.members} Mitglied{if $statistics[members] != 1}er{/if}</li>
<li>{#$statistics.threads} {if $statistics[threads] == 1}Thema{else}Themen{/if}</li>
<li>{#$statistics.posts} {if $statistics.posts == 1}Beitrag{else}Beiträge{/if} ({#$statistics.postsPerDay|round:2} {if  $statistics[postsPerDay] == 1}Beitrag{else}Beiträge{/if} pro Tag)</li>
</ul>
{if $statistics[newestMember]}<p>Unser neuestes Mitglied heißt: {user object=$statistics[newestMember]}</p>{/if}


