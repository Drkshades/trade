{include file="header.tpl"}
{include file="account_menu.tpl"}
<div class="mkd-full-width" style="">
    <div class="mkd-full-width-inner">
        <div data-mkd-parallax-speed="1" class="account-seperator" style="">
        </div>
        <div data-mkd-parallax-speed="1" class="vc_row wpb_row vc_row-fluid mkd-section mkd-content-aligment-center mkd-grid-section" style="">
            <div class="clearfix mkd-section-inner">
                <div class="vc_empty_space" style="height: 30px"><span class="vc_empty_space_inner"></span></div>
                <div class="mkd-section-inner-margin clearfix">
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <h2>Ask for withdrawal:</h2>
                            </div>
                        </div>
                    </div>
                    {if $say eq 'processed'}
                    {if $batch eq ''}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>Withdrawal request has been successfully saved.</p>
                            </div>
                        </div>
                    </div>
                    {else}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>Withdrawal has been processed. Batch id: {$batch}</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {/if}
                    {if $fatals}
                    {if $fatal == 'times_limit'}
                    <div class="msg">You can withdraw {$settings.limit_withdraw_period_times} per {$settings.limit_withdraw_period_date} only.</div>
                    {/if}
                    {else}
                    {if $say eq 'ec_forbidden' || $errors.ec_forbidden}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>Sorry, withdraw for this processing is temproary forbidden.</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $say eq 'on_hold' || $errors.on_hold}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>Sorry, this amount on hold now.</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $say eq 'zero' || $errors.zero}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>Sorry, you can't request a withdraw smaller than {$currency_sign}0.00 only</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $say eq 'less_min' || $errors.less_min}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>Sorry, you can request not less than {$currency_sign}{*$settings.min_withdrawal_amount*}{$fees.amount_min}</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $say eq 'greater_max' || $errors.greater_max}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>Sorry, you can request not greater than {$currency_sign}{*$settings.max_withdrawal_amount*}{$fees.amount_max}</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $say eq 'daily_limit' || $errors.daily_limit}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>Sorry, you have exceeded a daily limit</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $say eq 'not_enought' || $errors.not_enought}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>Sorry, you have requested the amount larger than the one on your balance.</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $say eq 'invalid_transaction_code' || $errors.invalid_transaction_code}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>You have entered the invalid transaction code.</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $say eq 'invalid_tfa_code' || $errors.invalid_tfa_code}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>You have entered invalid 2FA code.</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $say eq 'no_deposits' || $errors.no_deposits}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>You have not done any deposits yet. Withdrawal function will be available after a deposit.</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $say eq 'no_active_deposits' || $errors.no_active_deposits}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>You must have active deposit to withdraw.</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $errors.demo}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>Withdraw is not available for demo account.</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    
                    {if $errors.turing_image}
                    <div class="wpb_wrapper">
                        <div class="wpb_text_column wpb_content_element">
                            <div class="wpb_wrapper">
                                <p>Invalid turing image</p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    {if $preview}                    
                    <form method="post" name="opts">
                        <input type="hidden" name="a" value="withdraw">
                        <input type="hidden" name="action" value="withdraw">
                        <input type="hidden" name="amount" value="{$amount}">
                        <input type="hidden" name="ec" value="{$ec}">
                        <input type="hidden" name="comment" value="{$comment|escape:html}">
                        <table cellspacing=0 cellpadding=2 border=0 class="form deposit_confirm">
                            <tbody>
                                <tr>
                                    <th>Payment System:</th>
                                    <td>{$currency}</td>
                                </tr>
                                <tr>
                                    <th>Account:</th>
                                    <td>{$account}</td>
                                </tr>
                                <tr>
                                    <th>Debit Amount:</th>
                                    <td>{$currency_sign}{$amount}</td>
                                </tr>
                                {* old
                                <tr>
                                    <th>Withdrawal Fee:</th>
                                    <td>
                                        {if $settings.withdrawal_fee > 0 || $settings.withdrawal_fee_min > 0}
                                        {if $settings.withdrawal_fee > 0}{$settings.withdrawal_fee}%{/if} 
                                        {if $settings.withdrawal_fee_min > 0}min. {$currency_sign}{$settings.withdrawal_fee_min}{/if}
                                        {else}
                                        We have no fee for this operation.
                                        {/if}
                                        </td>
                                        </tr>
                                        *}
                                        <tr>
                                            <th>Withdrawal Fee:</th>
                                        <td>
                                        {if $fees.fee > 0}
                                        {$fees.percent}% + {$currency_sign}{$fees.add_amount} (min. {$currency_sign}{$fees.fee_min} max. {if $fees.fee_max}{$currency_sign}{$fees.fee_max}{else}no{/if})
                                        {else}
                                        We have no fee for this operation.
                                        {/if}
                                    </td>
                                </tr>
                                {if $converted}
                                <tr>
                                    <th>Credit Amount:</th>
                                    <td>{$currency_sign}{$converted.amount}</td>
                                </tr>
                                <tr>
                                    <th>{$converted.fiat} Amount:</th>
                                    <td>{$to_withdraw}</td>
                                </tr>
                                {else}
                                <tr>
                                    <th>Credit Amount:</th>
                                    <td>{$currency_sign}{$to_withdraw}</td>
                                </tr>
                                {/if}                                
                                {*
                                <tr>
                                    <td colspan=2>You are withdrawing <b>{$currency_sign}{$amount}</b> of {$currency}. 
                                        {if $settings.withdrawal_fee > 0 || $settings.withdrawal_fee_min > 0} Our fee is 
                                        {if $settings.withdrawal_fee > 0}<b>{$settings.withdrawal_fee}%</b>{/if}
                                        {if $settings.withdrawal_fee > 0 && $settings.withdrawal_fee_min > 0} or {/if}
                                        {if $settings.withdrawal_fee_min > 0} <b>{$currency_sign}{$settings.withdrawal_fee_min}</b>{if $settings.withdrawal_fee > 0} as a minimum{/if}{/if}
                                        .
                                        {else}
                                        We have no fee for this operation. 
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan=2>Actually you will acquire the total of <b>{$currency_sign}{$to_withdraw}</b> on your {$currency} account {if $account}{$account}{/if}.</td>
                                </tr>
                                *}
                                {if $comment}
                                <tr>
                                    <th>Note:</th>
                                    <td>{$comment|escape:html}</td>
                                </tr>
                                {/if}
                                {if $settings.use_transaction_code && $userinfo.transaction_code}
                                <tr>
                                    <th>Transaction Code:</th>
                                    <td><input type="password" name="transaction_code" class=inpts size=15></td>
                                </tr>
                                {/if}                                
                                {if $userinfo.tfa_settings.withdraw}
                                <tr>
                                    <th>2FA Code:</th>
                                    <td><input type="text" name="tfa_code" class=inpts size=15> <input type="hidden" name="tfa_time" id="tfa_time"></td>
                                </tr>
                                {literal}
                                <script language=javascript>
                                    document.getElementById('tfa_time').value = (new Date()).getTime();
                                </script>
                                {/literal}
                                {/if}                                
                                <tr>
                                    <td colspan=2><input type=submit value="Confirm" class=sbmt></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    {else}
                    <form method=post>
                        <input type=hidden name=a value=withdraw>
                        <input type=hidden name=action value=preview>
                        <input type=hidden name=say value="">
                        {*
                        <table cellspacing=0 cellpadding=2 border=0 class="table-no-style">
                        <tr>
                            <td class="table-text-left">Account Balance:</td>
                            <td class="table-text-left">{$currency_sign}<b>{$ab_formated.total}</b></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><small>
                            {section name=p loop=$ps}
                            {if $ps[p].balance > 0}{$currency_sign}{$ps[p].balance} of {$ps[p].name}{if $hold[p].amount > 0} / {$currency_sign}{$hold[p].amount} on hold{/if}<br>{/if}
                            {/section}
                            </td>
                        </tr>
                        <tr>
                            <td class="table-text-left">Pending Withdrawals: </td>
                            <td class="table-text-left">{$currency_sign}<b>{if $ab_formated.withdraw_pending != 0}{$ab_formated.withdraw_pending}{else}0.00{/if}</b></td>
                        </tr>
                        {foreach item=ps from=$pay_accounts}
                        <tr>
                            <td>Your {$ps.name|escape:html} Account:</td>
                            <td>{if $ps.account != ''}{$ps.account|escape:html}{else}<a href="{"?a=edit_account"|encurl}"><i>not set</i></a>{/if}</td>
                        </tr>
                        {/foreach}
                        {foreach item=p from=$mpay_accounts}
                        <tr>
                            <td>Your {$p.name|escape:html} Account:</td>
                            <td>
                            {foreach item=ps from=$p.accounts}
                                {$ps.name|escape:html}: {if $ps.value != ''}{$ps.value|escape:html}{else}<a href="{"?a=edit_account"|encurl}"><i>not set</i></a>{/if}<br>
                            {/foreach}
                            </td>
                        </tr>
                        {/foreach}
                        </table>
                        *}
                        <table cellspacing=0 cellpadding=2 border=0 class="table-no-style">
                            <tr>
                                <td class="table-text-left">Account Balance:</td>
                                <td class="table-text-left">{$currency_sign}<b>{$ab_formated.total}</b></td>
                            </tr>
                            <tr>
                                <td class="table-text-left">Pending Withdrawals: </td>
                                <td class="table-text-left">{$currency_sign}<b>{if $ab_formated.withdraw_pending != 0}{$ab_formated.withdraw_pending|amount_format}{/if}</b></td>
                            </tr>
                        </table>
                        <table cellspacing=0 cellpadding=2 border=0 class="table-no-style">
                            <tr>
                                <th></th>
                                <th>Processing</th>
                                <th>Available</th>
                                {if $have_hold}
                                <th>On Hold</th>
                                {/if}
                                <th>Pending</th>
                                <th>Account</th>
                            </tr>
                            {foreach from=$ps item=p}
                            <tr>
                            <td>{if $p.available > 0}{if $p.status > 0 || $p.available > 0}<input type="radio" name="ec" value="{$p.id}" {if $frm.ec == $p.id}checked{/if}>{/if}{/if}</td>
                            <td><img src="images/{$p.id}.gif" width=44 height=17 align=absmiddle> {$p.name|escape:html}</td>
                            <td><b style="color:green">{$currency_sign}{$p.available}</b></td>
                            {if $have_hold}
                                <td><b style="color:gray">{$currency_sign}{$p.hold}</b></td>
                            {/if}
                            <td><b style="color:red">{$currency_sign}{$p.pending}</b></td>
                            <td>{if $p.account != ''}{$p.account|escape:html}{else}<a href="{"?a=edit_account"|encurl}"><i>not set</i></a>{/if}</td>
                            </tr>
                            {/foreach}
                        </table>
                        
                        {if $have_available}
                        <table cellspacing=0 cellpadding=2 border=0 width=200 class="table-no-style">
                            <tr>
                                <td colspan=2>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Withdrawal ({$currency_sign}):</td>
                                <td><input type=text name=amount value="{$frm.amount|amount_format|default:"10.00"}" class=inpts size=15></td>
                            </tr>
                            <tr>
                                <td colspan=2><textarea name=comment class=inpts cols=45 rows=4>Your comment</textarea>
                            </tr>
                            {if $ti.check.withdrawal}
                            <tr>
                                <td class=menutxt align=right><img src="{"?a=show_validation_image&`$ti.session.name`=`$ti.session.id`&rand=`$ti.session.rand`"|encurl}"></td>
                                <td><input type=text name=validation_number class=inpts size=15></td>
                            </tr>
                            {/if}
                            <tr>
                                <td>&nbsp;</td>
                                <td><input type=submit value="Request" class=sbmt></td>
                            </tr>
                        </table>
                        {else}
                        <br><br>
                        <p class="table-text-left">You have no funds to withdraw.</p>
                        {/if}
                        </form>
                    {/if}
                    {/if}
                </div>
                <div class="vc_empty_space" style="height: 30px"><span class="vc_empty_space_inner"></span></div>
            </div>
        </div>
    </div>
</div>
{include file="footer.tpl"}