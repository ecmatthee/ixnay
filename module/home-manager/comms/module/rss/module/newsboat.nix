{
  programs = {
    newsboat = {
      enable = true;
      autoReload = true;
      maxItems = 50;
      reloadTime = 60;
      reloadThreads = 50;
      extraConfig = ''
        save-path '~/.local/share/newsboat/saved/'
        macro v set browser "mpv %u" ; open-in-browser ; set browser "elinks %u"
      '';
      urls = [
        # hackernews
        {
          url = "https://hnrss.org/best";
          tags = [
            "hackernews"
          ];
        }
        {
          url = "https://hnrss.org/bestcomments";
          tags = [
            "hackernews"
          ];
        }
        {
          # drewdevault
          url = "https://drewdevault.com/blog/index.xml";
          tags = [
            "blog"
            "code"
          ];
        }
        {
          # fasterthanlime
          url = "https://fasterthanli.me/index.xml";
          tags = [
            "blog"
            "code"
          ];
        }
        {
          # Lord.io
          url = "https://lord.io/feed.xml";
          tags = [
            "blog"
            "code"
          ];
        }
        {
          # Mara's Blog
          url = "https://blog.m-ou.se/index.xml";
          tags = [
            "blog"
            "code"
          ];
        }
        {
          # Matklad
          url = "https://matklad.github.io/feed.xml";
          tags = [
            "blog"
            "code"
          ];
        }
        {
          # Ted Kaminski
          url = "https://www.tedinski.com/feed.xml";
          tags = [
            "blog"
            "code"
          ];
        }
        {
          # Xeiaso
          url = "https://xeiaso.net/blog.rss";
          tags = [
            "blog"
            "code"
          ];
        }
        {
          # This Week in rust
          url = "https://this-week-in-rust.org/rss.xml";
          tags = [
            "newsletter"
            "code"
          ];
        }
        {
          # Starsector
          url = "https://fractalsoftworks.com/feed/";
          title = "Starsector Newsletter";
          tags = [
            "newsletter"
            "games"
          ];
        }
        {
          # Aarthificial
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtEwVJZABCd0tels2KIpKGQ";
          tags = [
            "youtube"
            "code"
          ];
        }
        {
          # Ahoy
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCE1jXbVAGJQEORz9nZqb5bQ";
          tags = [
            "youtube"
            "essay"
            "games"
          ];
        }
        {
          # annapantsu
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmuobr4DmrmLI1BaGZD3p5w";
          tags = [
            "youtube"
            "entertainment"
          ];
        }
        {
          # CodeAesthetic
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCaSCt8s_4nfkRglWCvNSDrg";
          tags = [
            "youtube"
            "code"
          ];
        }
        {
          # Core-A Gaming
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCT7njg__VOy3n-SvXemDHvg";
          tags = [
            "youtube"
            "essay"
            "games"
          ];
        }
        {
          # Every Frame a Painting
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCjFqcJQXGZ6T6sxyFB-5i6A";
          tags = [
            "youtube"
            "essay"
            "film"
          ];
        }
        {
          # The Escapist
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCqg5FCR7NrpvlBWMXdt-5Vg";
          tags = [
            "youtube"
            "essay"
            "games"
          ];
        }
        {
          # exurb1a
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCimiUgDLbi6P17BdaCZpVbg";
          tags = [
            "youtube"
            "essay"
          ];
        }
        {
          # Filaxim Historia
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLA-PoQkSsIP6wWP0PUzFgQ";
          tags = [
            "youtube"
            "essay"
            "history"
          ];
        }
        {
          # GCP Grey
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2C_jShtL725hvbm1arSV9w";
          tags = [
            "youtube"
            "essay"
          ];
        }
        {
          # JustWrite
          # Check
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCx0L2ZdYfiq-tsAXb8IXpQg";
          tags = [
            "youtube"
            "essay"
            "film"
          ];
        }
        {
          # Kurzgesagt
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsXVk37bltHxD1rDPwtNM8Q";
          tags = [
            "youtube"
            "essay"
            "science"
          ];
        }
        {
          # Lackadaisy 
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCHpyAufyq1-igTlgA9XjbcQ";
          tags = [
            "youtube"
            "entertainment"
          ];
        }
        {
          # Mauler
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCXX1iQGufHujuIvQ38MPKMA";
          tags = [
            "youtube"
            "essay"
            "games"
            "film"
          ];
        }
        {
          # Mental Checkpoint
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2wNnyb3vWhOt0K6LpBrtGg";
          tags = [
            "youtube"
            "essay"
            "games"
            "to-remove"
          ];
        }
        {
          # No Boilerplate
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUMwY9iS8oMyWDYIe6_RmoA";
          tags = [
            "youtube"
            "code"
          ];
        }
        {
          # Overly Sarcastic Productions
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCodbH5mUeF-m_BsNueRDjcw";
          tags = [
            "youtube"
            "essay"
            "writing"
            "history"
          ];
        }
        {
          # Rational Animations
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgqt1RE0k0MIr0LoyJRy2lg";
          tags = [
            "youtube"
            "essay"
            "science"
          ];
        }
        {
          # Razbuten
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCfHmyqCntYHQ81ZukNu66rg";
          tags = [
            "youtube"
            "essay"
            "games"
            "to-remove"
          ];
        }
        {
          # Sebastian Lague
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmtyQOKKmrMVaKuRXz02jbQ";
          tags = [
            "youtube"
            "code"
          ];
        }
        {
          # Sideways
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCi7l9chXMljpUft67vw78qw";
          tags = [
            "youtube"
            "essay"
            "music"
          ];
        }
        {
          # SNESDrunk
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCfBLXTwLoUpDAkHcHizW3Jg";
          tags = [
            "youtube"
            "essay"
            "games"
          ];
        }
        {
          # t3ssel8r
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCIjUIjWig0r5DIixQrt6A3A";
          tags = [
            "youtube"
            "code"
          ];
        }
        {
          # The Chalkeaters
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCYSvX0lqo-ZinYNQSHVCqlQ";
          tags = [
            "youtube"
            "entertainment"
          ];
        }
        {
          # The Stupendium
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCvbc2N6biTMUDFE_b79TPbw";
          tags = [
            "youtube"
            "entertainment"
          ];
        }
        {
          # Vivziepop
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzfyYtgvkx5mLy8nlLlayYg";
          tags = [
            "youtube"
            "entertainment"
          ];
        }
        # TODO Quality Check
        {
          # Ellen Brock
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgvu0q49l3BfsMyp9WSTQLw";
          tags = [
            "youtube"
            "writing"
          ];
        }
        {
          # Leon Massey
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCo8186mZYAY49flt6HkbqlQ";
          tags = [
            "youtube"
            "essay"
            "games"
          ];
        }
        {
          # Typhoon 
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgNTbrlCS9wY6mQM2cbeUpQ";
          tags = [
            "youtube"
            "essay"
            "games"
          ];
        }
        {
          # TheoryFighter 
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCmSXm8C4D_jq0nKMCzTTyLg";
          tags = [
            "youtube"
            "essay"
            "games"
          ];
        }
        {
          # Akshon Esports 
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6dI8msF1_I9HuDSvMtk_nQ";
          tags = [
            "youtube"
            "essay"
            "games"
          ];
        }
        {
          # No Bones 
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCQ34-Umqv6w91m99Qn-Qrug";
          tags = [
            "youtube"
            "essay"
            "film"
          ];
        }
        {
          # J. Draper  
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCF0-84qhSDVOq8i2I3jDVcA";
          tags = [
            "youtube"
            "essay"
            "history"
          ];
        }
        {
          # New Frame Plus 
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxO_ya-RmAXCXJCU54AxYFw";
          tags = [
            "youtube"
            "essay"
            "games"
          ];
        }
        {
          # SugarPunch 
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCGuEUDyVRDA2SENHCnOuBew";
          tags = [
            "youtube"
          ];
        }
        {
          # Historically 
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCoZd78hRUdxxsuGiABuHF_A";
          tags = [
            "youtube"
            "history"
          ];
        }
        {
          # Arch
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCB5zZAm0b5-EqWkOEwHBE_A";
          tags = [
            "youtube"
            "essay"
            "games"
          ];
        }
        {
          # Aleph 0 
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCzBjutX2PmitNF4avysL-vg";
          tags = [
            "youtube"
            "math"
          ];
        }
        {
          # BrendanMushi
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLi1hzUp1tIwErHBgDUtRpA";
          tags = [
            "youtube"
            "games"
          ];
        }
        {
          # Rubbish 
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCV_wKeXYrWwISSDpO1BPzGA";
          tags = [
            "youtube"
            "games"
          ];
        }
        {
          # Bafael  
          url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtX2bD2XTL8LgykPcPY9GLg";
          tags = [
            "youtube"
            "games"
          ];
        }
      ];
    };
  };
}
