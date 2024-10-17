{capture assign='__userNotice'}
	{if $__wcf->session->getPermission('admin.configuration.package.canUpdatePackage') && $__wcf->getAvailableUpdates() && SHOW_UPDATE_NOTICE_FRONTEND}
		<p class="info" role="status">{lang}wcf.page.availableUpdates{/lang}</p>
		{else}
	{lang}wcf.acp.package.searchForUpdates.noResults{/lang}
	{/if}
	{if OFFLINE && $__wcf->session->getPermission('admin.general.canViewPageDuringOfflineMode')}
		<div class="warning" role="status">
			<p><strong>{lang}wcf.page.offline{/lang}</strong></p>
			<div>{if OFFLINE_MESSAGE_ALLOW_HTML}{@OFFLINE_MESSAGE|phrase}{else}{@OFFLINE_MESSAGE|phrase|newlineToBreak}{/if}</div>
		</div>
	{/if}
	{event name='userNotice'}
{/capture}

{if $__userNotice|trim}
	<div class="userNotice">
		{@$__userNotice}
	</div>
{/if}