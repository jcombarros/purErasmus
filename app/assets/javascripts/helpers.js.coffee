# ----
# Common methods.
# ----

$.helpers = {}

# Method to update a Dropdown by retrieving a list of values.
$.helpers.update_dropdown = (url, dropdown_to_update, after, additional_option) ->
    # Make a request to retrieve the universities for the selected country.
    $.ajax
        url: url
        type: "GET"
        dataType: "json"
        success: (data) =>
            # Reset the DropDown.
            $.helpers.reset_dropdown(dropdown_to_update, additional_option)

            # Add the retrieved elements.
            $.each(data, ->
                if (after)
                    dropdown_to_update.append($.helpers.create_select_option(this.id, this.name))
                else
                    dropdown_to_update.prepend($.helpers.create_select_option(this.id, this.name))                    
            )

# Empty a Dropdown and add the "Other" value.
$.helpers.reset_dropdown = (dropdown_to_reset, additional_option) ->
    dropdown_to_reset.empty()
    dropdown_to_reset.append($.helpers.create_select_option(-1, additional_option)) if additional_option

# Method to create the Select Option from a value and a text.
$.helpers.create_select_option = (value, text) ->
    $("<option></option>").attr("value", value).text(text)