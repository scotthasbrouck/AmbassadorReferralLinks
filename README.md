#Tim Berners‐Lee Invents the World Wide Web, Needs Referrals to Grow It

As part of your interview to work with the Ambassador team, we’d like you to demonstrate your experience, skills, and learning ability by building a prototype of the web’s most minimal referral automation software.

##Background

The year is 1991, and Tim Berners­Lee has just invented the World Wide Web. As his best friend, he turns to you for help growing this crazy new thing. You decide referral marketing is the most effective way to grow support for Tim’s invention and plan to bring word of mouth to the web in the form of a simple, automated referral system.
The system you’ve dreamt up is very straightforward. It only needs two pages to satisfy Tim’s needs: one to create, edit, delete, and track referral links and another to serve as a landing page for the links that promotes the World Wide Web.


##Spec

__Link page__

The link page is where Tim will manage his referral links. This page should be located at the root of your domain i.e. {your_url}. There should be a form to add links. It only needs one field, which is the unique title of the link e.g. spartans or wolverines. This title will form the referral url e.g. {your_url}/spartans or {your_url}/wolverines. Below this form should be a list of the active referral links with options to edit or delete links. The # of times a link has been clicked should be tracked and displayed next to each link in the list.

__Landing page__

The landing page is where each referral link should redirect. This page should be located at it’s own unique url i.e. {your_url}/landing. The content of this page is not important, though you should feel free to use it as a canvas to promote and express your feelings toward the World Wide Web for Tim. When each referral link redirects to the landing page, the link title must be appended as a query parameter in the url e.g. {your_url}/landing/?link={link_title}. The link title should be grabbed from the query parameter and displayed somewhere on the landing page, which is the only content you actually have to include.

__How__

All source control should be done via Git and GitHub. If you wish to keep your repo private, just add chaselee as an admin so we can see your work and share it with each other.
If you’re interviewing for a back­end position, please use Django Rest Framework and host your project on Heroku.
If you’re interviewing for a front­end position, please build your project as a purely client­side app using AngularJS and Bootstrap, and host it on Heroku.
If you’re interviewing for a full­stack position, feel free to blend the former approaches, just be sure to demonstrate your competence across the stack.
If you’re interviewing for a mobile position please use the native SDKs for Android or iOS.
Styling is not required (unless it’s pertinent to your position), but feel free to be creative and show off your talents and taste. In fact, we appreciate going above and beyond where ever you feel you should, and doing so is what will earn you a spot on the team.

__When__

This project is intended to take at most 1­4 hours depending on your familiarity with the frameworks and tools you choose. Make your initial commit very small or blank so that we can get a sense of your style and speed. If you have any questions please do not hesitate to email us, and we’ll get back ASAP.