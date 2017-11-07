package com.amandris.clients.web.util;

public class HtmlForm {
    
    public final static String TITLE_BACKGROUND  = "\"#DD55AA\""; 
    public final static String TITLE_FOREGROUND  = "\"#FFFFFF\""; 
    public final static String BORDER_BACKGROUND = "\"#000000\""; 
    
    public final static String DEFAULT_FONT      = "Verdana, Arial, Helvetica, sans-serif";
    public final static String BUTTON_STYLE      = " style=\"color: #000000; font-family: " + DEFAULT_FONT + "; font-weight: bold; background-color: #E0E6DE; border-style: solid; border-width: 1; border-color: #697D70\"";
    public final static String INPUT_STYLE       = " style=\"color: #495D50; font-family: " + DEFAULT_FONT + "; font-weight: bold; background-color: #E0E6DE; border-style: solid; font-size: 10 px; border-width: 1\"";
    public final static String LEFT              = "\"left\"";
    public final static String RIGHT             = "\"right\"";
    public final static String CENTER            = "\"center\"";

    public final static int    MAX_CELLS         = 10;

    String  Action;
    String  Name;
    String  FormSize        = "100%";
    String  HeaderSize      = "2";
    String  ObjectSize      = "1";
    int     RowPercentage   = 0;
    
    boolean CreateRow       = true;
    boolean FirstTitle      = true;
    
    StringBuffer StringForm = new StringBuffer( "");
    
    public HtmlForm( String name, String action, String formSize, String headerSize, String objectSize)
    {
        Name        = name;
        Action      = action;
        FormSize    = formSize;        
        HeaderSize  = headerSize;
        ObjectSize  = objectSize;
    }
    
    public HtmlForm( String name, String action, String formSize)
    {
        this( name, action, formSize, "2", "1");
    }
    
    public void start()
    {
        StringForm.append( "\n<table align=\"center\" border=\"0\" width=\"" + FormSize + "\" cellspacing=\"0\" cellpadding=\"3\" bordercolor=" + BORDER_BACKGROUND + ">\n\t<tbody>");
    }
    
    public void end()
    {
        StringForm.append( "\n\t\t\t</form>\n\t</tbody>\n</table>");
    }
    
    public void addHeader( String title, String explanation)
    {
        if( title != null)
            StringForm.append("\n\t\t\t<tr>\n\t\t\t\t<td colSpan=\"" + MAX_CELLS + "\" width=\"100%\"><p><font face=\"" + DEFAULT_FONT + "\" size=\"" + HeaderSize + "\"><b>" + title + "</b></p><p>" + explanation + "</p><br>\n\t\t\t\t</td>\n\t\t\t</tr>")
        ;
        StringForm.append("\n\t\t\t<form action=\"" + Action + "\" method=\"post\" name=\"" + Name + "\">");
    }
    
    public void addTitle( int margin, String title, String explanation)
    {
        if( !FirstTitle)
            addLabel( 0, LEFT, "&nbsp")
        ;
        
        if( margin != 0)
            StringForm.append("\n\t\t\t\t<tr>\n\t\t\t\t\t<td colSpan=\"" + (MAX_CELLS * margin / 100) +  "\" bgcolor=" + TITLE_BACKGROUND + "></td>")
        ;
        StringForm.append("\n\t\t\t\t\t<td colSpan=\"" + (MAX_CELLS - (MAX_CELLS * margin / 100)) + "\" width=\"100%\" align=\"left\" bgcolor=" + TITLE_BACKGROUND +"><font face=\"" + DEFAULT_FONT + "\" size=\"" + ObjectSize + "\" color=" + TITLE_FOREGROUND + "><b>" + title + "</b>" + explanation + "</td>\n\t\t\t\t</tr>");
        
        FirstTitle = false;
    }

    
    protected void addObject( int percentage, String align, String data)
    {
        if( CreateRow) {
            StringForm.append("\n\t\t\t\t<tr>");
            
            CreateRow     = false;
            RowPercentage = 0;
        }
        
        int Percentage = (percentage == 0 ? 100 - RowPercentage : percentage);
        
        StringForm.append("\n\t\t\t\t\t<td colSpan=\"" + (Percentage * MAX_CELLS / 100) + "\" width=\"" + Percentage + "%\" vAlign=\"center\" align=" + align + "><font face=\"" + DEFAULT_FONT + "\" size=\"" + ObjectSize + "\">" + data + "</font></td>");
        
        RowPercentage += percentage;
        
        if( percentage == 0) {
            StringForm.append("\n\t\t\t\t</tr>");
            CreateRow = true;
        }
            
    }
    
    public void addHidden( String name, String value)
    {
        StringForm.append( "\n\t\t\t\t\t<input type=\"hidden\" name=\"" + name + "\" value=\"" + value + "\">");
    }
    
    public void addLink( int percentage, String align, String label, String link, String target)
    {
        addObject( percentage, align, "<a href=\"" + link + "\" target = \"" + target + "\"<font face=\"" + DEFAULT_FONT + "\" size=\"" + ObjectSize + "\"><b>" + label + "</b></font></a>");
    }
    
    public void addLink( int percentage, String align, String label, String link)
    {
        addLink( percentage, align, label, link, "_self");
    }
    
    public void addInputLabel( int percentage, String align, String label)
    {
        addObject( percentage, align, "<b>" + label + "</b>");
    }
    
    public void addLabel( int percentage, String align, String label)
    {
        addObject( percentage, align, label);
    }
    
    public void addTextField( int percentage, String align, String name, String value, int size)
    {
        addObject( percentage, align, "<input name=\"" + name + "\" value=\"" + value + "\" size=\"" + size + "\"" + INPUT_STYLE + ">");
    }
    
    public void addPasswordField( int percentage, String align, String name, String value, int size)
    {
        addObject( percentage, align, "<input type=\"password\" name=\"" + name + "\" value=\"" + value + "\" size=\"" + size + "\"" + INPUT_STYLE + ">");
    }
    
    public void addTextArea( int percentage, String align, String name, String value, int columns, int rows)
    {
        addObject( percentage, align, "<textarea name=\"" + name + "\" cols=\"" + columns + "\" rows=\"" + rows + "\" wrap=\"VIRTUAL\"" + INPUT_STYLE + ">" + value + "</textarea>");
    }
    
    public void addCombo( int percentage, String align, String name, String value, String options[])
    {
        String Data = "<select name=\"" + name + "\"" + INPUT_STYLE + "><option selected>" + value + "</option>";
        
        for( int i = 0; i < options.length; i++) {
            Data += "<option>" + options[ i] + "</option>";
        }
        
        Data += "</select>";
        
        addObject( percentage, align, Data);
        
    }

    protected void addCheckRadio( int percentage, String align, String type, String name, String value, boolean checked)
    {
        addObject( percentage, align, "<input name=\"" + name + "\" type=\"" + type + "\" value=\"" + value + "\"" + ( checked ? "CHECKED" : "") + ">");
    }
    
    public void addCheckBox( int percentage, String align, String name, String value, boolean checked)
    {
        addCheckRadio( percentage, align, "checkbox", name, value, checked);
    }

    public void addRadioButton( int percentage, String align, String name, String value, boolean checked)
    {
        addCheckRadio( percentage, align, "radio", name, value, checked);
    }
    
    protected void addButton( int percentage, String align, String name, String value, String type)
    {
        addObject( percentage, align, "<input name=\"" + name + "\" value=\"" + value + "\" type=\"" + type + "\"" + BUTTON_STYLE + ">");
    }

    public void addButton( int percentage, String align, String name, String value)
    {
        addButton( percentage, align, name, value, "submit");
    }

    public void addButtonSubmit( int percentage, String align, String name, String value)
    {
        addButton( percentage, align, name, value, "submit");
    }

    public void addButtonReset( int percentage, String align, String name, String value)
    {
        addButton( percentage, align, name, value, "reset");
    }

    public void addLine( int percentage, String align, int size)
    {
        addObject( percentage, align, "<hr size=\"" + size + "\"");
    }
    
    public String toString()
    {
        return StringForm.toString();
    }   
}
