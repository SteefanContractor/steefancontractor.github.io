---
title:
date: 2022-10-24
type: landing

sections:
  - block: about.biography
    id: about
    content:
      title:
      username: admin
  - block: portfolio
    id: projects
    content:
      title: Projects
      filters:
        folders:
          - project
      default_button_index: 0
      buttons:
        - name: All
          tag: '*'
        - name: Deep Learning
          tag: deep learning
        - name: Natural Language Processing
          tag: natural language processing
        - name: Computer Vision
          tag: computer vision
        - name: Data Visualization
          tag: data visualization
    design:
      columns: '2'
      view: showcase
      flip_alt_rows: false
  - block: contact
    id: contact
    content:
      title: Contact
      subtitle:
      text: |-
        Feel free to get in touch via my socials or fill out the contact form below to send me an email.
      address:
        street: UNSW Data Science Hub, Anita Lawrence Building H13, East Wing, Level 1, RC1050
        city: UNSW Sydney
        region: NSW
        postcode: '2052'
        country: Australia
        country_code: AU
      #   - 'Monday 10:00 to 13:00'
      #   - 'Wednesday 09:00 to 10:00'
      # contact_links:
      #   - icon: twitter
      #     icon_pack: fab
      #     name: DM Me
      #     link: 'https://twitter.com/Twitter'
      #   - icon: skype
      #     icon_pack: fab
      #     name: Skype Me
      #     link: 'skype:echo123?call'
      #   - icon: video
      #     icon_pack: fas
      #     name: Zoom Me
      #     link: 'https://zoom.com'
      # Automatically link email and phone or display as text?
      autolink: true
      # Email form provider
      form:
        provider: formspree
        formspree:
          id: xgebbjbl
        # netlify:
        #   # Enable CAPTCHA challenge to reduce spam?
        #   captcha: false
    design:
      columns: '2'
---
