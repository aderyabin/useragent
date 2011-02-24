module UserAgent

  mattr_accessor :request

  OPERATION_SYSTEMS = {'Windows Vista' => /Windows NT 6/,
                       'Windows Server 2003/Windows x64' => /Windows NT 5.2/,
                       'Windows XP' => /Windows NT 5.1/,
                       'Windows 2000' => /Windows NT 5.0/,
                       'Windows NT 4' => /Windows NT 4.0/,
                       'Windows ME' => /WindowsME/,
                       'Windows98' => /Windows98/,
                       'Windows95' => /Windows95/,
                       'Symbian OS' => /Symbian/,
                       'Fedora Core' => /Fedora/,
                       'FreeBSD' => /FreeBSD/,
                       'Red Hat' => /Red Hat/,
                       'SUSE' => /SUSE/,
                       'Mandriva' => /Mandriva/,
                       'Ubuntu' => /Ubuntu/,
                       'Debian' => /Debian/,
                       'ASP Linux' => /ASPLinux/,
                       'ALT Linux' => /ALTLinux/,
                       'PC Linux' => /PCLinuxOS/,
                       'Mandrake' => /Mandrake/,
                       'Sun OS' => /SunOS/,
                       'Intel Mac OS' => /Intel Mac OS/,
                       'Mac OS X' => /PPC Mac OS X/,
                       'Amiga OS' => /AmigaOS/,
                       'iPad' => /iPad/,
                       'iPhone' => /iPhone/}


  BROWSERS = {"Internet Explorer V8" => /MSIE 8.0/,
              "Internet Explorer V7" => /MSIE 7.0/,
              "Internet Explorer V6.0" => /MSIE 6.0/,
              "Internet Explorer V5.5" => /MSIE 5.5/,
              "Internet Explorer V5.22" => /MSIE 5.22/,
              "Internet Explorer V5.0" => /MSIE 5.0/,
              "Internet Explorer V4.0" => /MSIE 4.0/,
              "Internet Explorer V3.0" => /MSIE 3.0/,
              "Internet Explorer V2.0" => /MSIE 2.0/,
              "Mozilla Firefox" => /Firefox/,
              "Camino" => /Camino/,
              "Dillo" => /Dillo/,
              "Epiphany" => /Epiphany/,
              "Mozilla Firebird" => /Firebird/,
              "Mozilla Thunderbird" => /Thunderbird/,
              "Mozilla Galeon" => /Galeon/,
              "IBrowse" => /IBrowse/,
              "iCab" => /iCab/,
              "K-Meleon" => /K-Meleon/,
              "Konqueror" => /Konqueror/,
              "SeaMonkey" => /SeaMonkey/,
              "Netscape" => /Netscape/,
              "OmniWeb" => /OmniWeb/,
              "Opera" => /Opera/,
              "Safari" => /Safari/}

  def os_list
    OPERATION_SYSTEMS.keys
  end

  def browsers_list
    BROWSERS.keys
  end

  def self.os
    OPERATION_SYSTEMS.each_pair { |key, value| return key if  user_agent.index(value) }
    return 'unknown'
  end

  def self.browser
    BROWSERS.each_pair { |key, value| return key if  user_agent.index(value) }
    return 'unknown'
  end

  def self.detect(req)
    self.request = req
    [os, browser, user_agent]
  end

  def self.user_agent
    @user_agent ||= begin
      request.env['HTTP_USER_AGENT']
    rescue
      ''
    end
  end
end