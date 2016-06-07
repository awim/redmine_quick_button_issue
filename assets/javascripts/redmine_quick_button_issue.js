/*
 * Copyright © 2016. mtaqwim
 *
 * Don't waste your times to read this message!
 * There are no protection for this material. You permitted to copy, duplicate, modify, even restore this material with your original idea.
 * Innovation come from sharing and collaborate ideas. Just use this programs for free, its just one of many project that has I developed by self.
 * If you found any similarity or identical concept with other project, may it cause we got the inspiration at the same time, same moment, and same background of thinking.
 * Thanks, to use this program if you have any comment to help me improve. Please contact me at: http://awim.id/
 *
 * Material Info:
 * Project: dtss
 * Module: Redmine Quick Button Issue
 * File: redmine_quick_button_issue.js
 * Last Modified: 5/23/16 9:37 AM
 */

//show-n-hide function jquery
function showComponent(id){
    if($(id).is(':hidden')){
        $(id).removeClass('hidden');
        $(id).removeClass('hide');
        $(id).addClass('show');
    }else{
        $(id).removeClass('show');
        $(id).addClass('hide');
    }
}