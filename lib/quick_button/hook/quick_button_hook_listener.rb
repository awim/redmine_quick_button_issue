module QuickButton
  module Hook
    class QuickButtonHookListener < Redmine::Hook::ViewListener
      def view_quick_button_in_action_menu(context={})
        nil
      end

      def view_layouts_base_html_head(context={})
        return stylesheet_link_tag(:redmine_quick_button_issue, :plugin => 'redmine_quick_button_issue')
      end
    end
  end
end