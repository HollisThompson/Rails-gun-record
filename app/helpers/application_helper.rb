module ApplicationHelper
    def destroy_gun_button(gun)
        "<form class='button_to' method='post' action='#{gun_url(gun)}''>
            <input type='hidden' value='delete' name = '_method'>
            <input type='submit' value='destroy' />
            <input type='hidden' value='#{form_authenticity_token}' name = 'authenticity_token'>
        </form>".html_safe
    end

    def edit_gun_button(gun)
        "<form class='button_to' method='edit' action='#{edit_gun_url(gun)}''>
            <input type='submit' value='edit' />
        </form>".html_safe
    end

    def show_gun_button(gun)
        "<form class='button_to' method='button' action='#{gun_url(gun)}''>
            <input type='submit' value='show' />
        </form>".html_safe
    end
end