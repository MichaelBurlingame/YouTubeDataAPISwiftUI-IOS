# SwiftUIYouTubeDataAPI-IOS

<h3>Goal Of The App</h3>
<ul>
  <li>Display Live Search Data from Youtube (Without Signing Into A Google Account)</li>
  <li>Display PLAYABLE Videos</li>
  <li>Understand How To Navigate Developer Documentation</li>
</ul>

<img width="200" alt="ScreenShot" src="https://user-images.githubusercontent.com/125146109/220634458-22253cc1-e2e3-428c-8362-04aa38bcdc31.png">

<h3>Features</h3>
<ul>
  <li>Featured Videos Pages (Linked To Featured YouTube Playlists)</li>
  <li>Search For YouTube Videos</li>
  <li>Watch YouTube Videos Via Webkit</li>
</ul>

<h3>YouTube Data API:</h3>
<p>Before Using You Need To Obtain An API KEY From Google & Paste It Into The API_KEY Variable in Constants.swift</p>
<ul>
  <li><a href="https://developers.google.com/youtube/v3/docs" target="_blank">Documentation</a></li>
</ul>

<p>Making This App Gave Me An Oppurtunity To Learn How To Navigate Through Developers Documentation For API's. In My Opinion, This Was My Biggest Takeaway From This Project. In Most Cases, API Developers Layout Exactly How To Use The API & How It Might Respond. This Took Numerous Attempts To Get Working Mainly Due To Decoding The Nested Json Data That's Returned To Store Properties Such As VideoIds & Thumbnails. Overall, This App Was A Great Learning Oppurtunity For Working With JSON.</p>

<h3>Data Decoded</h3>
<ul>
  <li>Video ID</li>
  <li>Video Title</li>
  <li>Channel Title</li>
  <li>HD Thumbnail URL</li>
</ul>

<h3>Sample Response:</h3>

<img width="300" alt="Screen Shot 2023-02-21 at 7 47 56 PM" src="https://user-images.githubusercontent.com/125146109/220491999-1863f4f6-84b0-4fea-a207-cab563eed4a8.png">

<h3>Improvments Needed</h3>
<ul>
  <li>Playlists Aren't Available To Be Searched Or Made</li>
  <li>Webkit Wasn't My First Choice As A Video Player. However, It Proves The Concept Of Obtaining Live Data From YouTube. Also, Embeding The Video Wouldn't Be Ideal Due To YouTube Policies</li>
  <li>While The App Is Functional, The UI Doesn't Feel Complete</li> 
  <li>Some Titles May Not Be Fully Covered By String Formatter & May Result In Odd Characters Mixed Into Titles</li>
</ul>
