class ValidateController < ApplicationController
  def passwordcheck


    session[:username] = params[:username]
    session[:password] = params[:pass]


    def validatePassword(username, password)


      if check6char(username, "Username") || usrDoesNotContainSpecial(username, "Username") || check6char(password, "Password") || !pswdDoesNotContainSpecial(password, "Password") || pswdContainPswd(password)
      else
        "Username and password are valid!"
      end
    end

    def check6char(str, str2)
      if str.length < 6
        flash.now[:alert] =  "#{str2} must have more than 6 characters"
        true
      end
    end

    def usrDoesNotContainSpecial(str, str2)
      a = (str =~ /[!#$]/)
      if a.to_i > 0
        flash.now[:alert] = "#{str2} can not contain any special characters."
        true
      else
        false
      end
    end

    def pswdDoesNotContainSpecial(str, str2)
      a = (str =~ /[!#$]/)
      if a.to_i > 0
        true
      else
        flash.now[:alert] = "#{str2} must contain at least one $, !, or #."
        false
      end
    end

    def pswdContainPswd(str)
      if str.upcase.include? "PASSWORD"
        flash.now[:alert] = "Password can not contain password!"
        true
      else
        false
      end
    end

    if !params[:username].nil? && !params[:pass].nil?
      flash.now[:notice] = validatePassword(session[:username], session[:password])
    end

  end
end
