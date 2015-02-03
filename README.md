RSImageView
===========

UIImage progressive download.

RSImageView is a simple and easy-to-use UIImageView subclass for the iOS app. The RSImageView class uses NSURLConnection behind, and constructs the UIImage from the downloaded data from the delegate methods of NSURLConnections.


![Screenshot](/Screenshots/screenshot1.png)


h2. Usage

<pre>
RSImageView *imageView = [[RSImageView alloc] initWithFrame:CGRectMake(10, 30, 340, 400)];
[imageView setImageURL:[NSURL URLWithString:@"https://docs.google.com/uc?export=download&id=0B6gRtssGeIGqTlRQT05QWFc5azg"]];
[self.view addSubview:imageView];

[imageView start];

</pre>
(see the sample project for more details)

You can stop the download by calling the "pause" action of RSImageView at any time.
