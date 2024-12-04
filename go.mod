module perkeep.org

go 1.16

require (
	bazil.org/fuse v0.0.0-20200524192727-fb710f7dfd05
	cloud.google.com/go v0.80.0
	cloud.google.com/go/datastore v1.1.0
	cloud.google.com/go/logging v1.3.0
	cloud.google.com/go/storage v1.10.0
	filippo.io/age v1.0.0
	github.com/FiloSottile/b2 v0.0.0-20170207175032-b197f7a2c317 // indirect
	github.com/aws/aws-sdk-go v1.34.0
	github.com/bradfitz/latlong v0.0.0-20170410180902-f3db6d0dff40
	github.com/facebookgo/ensure v0.0.0-20160127193407-b4ab57deab51 // indirect
	github.com/facebookgo/stack v0.0.0-20160209184415-751773369052 // indirect
	github.com/facebookgo/subset v0.0.0-20150612182917-8dac2c3c4870 // indirect
	github.com/garyburd/go-oauth v0.0.0-20180319155456-bca2e7f09a17
	github.com/go-sql-driver/mysql v1.5.0
	github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0 // indirect
	github.com/google/martian/v3 v3.2.1 // indirect
	github.com/gopherjs/gopherjs v0.0.0-20200217142428-fce0ec30dd00
	github.com/gopherjs/jquery v0.0.0-20180404123100-3ba2b901425e
	github.com/goplusjs/gopherjs v1.1.6
	github.com/gorilla/websocket v1.4.2
	github.com/hjfreyer/taglib-go v0.0.0-20151027170453-0ef8bba9c41b
	github.com/jonas-p/go-shp v0.1.1 // indirect
	github.com/lib/pq v1.10.2
	github.com/mailgun/mailgun-go v0.0.0-20171127222028-17e8bd11e87c
	github.com/mattn/go-mastodon v0.0.5-0.20190517015615-8f6192e26b66
	github.com/miekg/dns v1.1.43
	github.com/nf/cr2 v0.0.0-20140528043846-05d46fef4f2f
	github.com/perkeep/b2 v0.0.0-20180913003434-1ae8d9b78db9
	github.com/pkg/sftp v1.13.2
	github.com/plaid/plaid-go v0.0.0-20161222051224-02b6af68061b
	github.com/russross/blackfriday v2.0.0+incompatible
	github.com/rwcarlsen/goexif v0.0.0-20190401172101-9e8deecbddbd
	github.com/shurcooL/sanitized_anchor_name v1.0.0 // indirect
	github.com/syndtr/goleveldb v1.0.1-0.20210305035536-64b5b1c73954
	github.com/tgulacsi/picago v0.0.0-20171229130838-9e1ac2306c70
	go4.org v0.0.0-20190218023631-ce4c26f7be8e
	golang.org/x/crypto v0.23.0
	golang.org/x/image v0.18.0
	golang.org/x/net v0.25.0
	golang.org/x/oauth2 v0.0.0-20210628180205-a41e5a781914
	golang.org/x/sync v0.7.0
	golang.org/x/time v0.0.0-20210723032227-1f47c861a9ac
	google.golang.org/api v0.42.0
	google.golang.org/genproto v0.0.0-20210716133855-ce7ef5c701ea // indirect
	gopkg.in/mgo.v2 v2.0.0-20160818020120-3f83fa500528
	honnef.co/go/js/dom v0.0.0-20200509013220-d4405f7ab4d8
	honnef.co/go/tools v0.2.1
	modernc.org/fileutil v1.0.1-0.20200808163328-2079183a536e // indirect
	modernc.org/kv v1.0.4
	modernc.org/sqlite v1.14.3
	myitcv.io v0.0.0-20201125173645-a7167afc9e13
	rsc.io/pdf v0.1.1
	rsc.io/qr v0.2.0
)

exclude (
	// google.golang.org/api/servicemanagement/v1@v0.43.0 deleted APIService.Enable
	google.golang.org/api v0.43.0
	google.golang.org/api v0.44.0
	google.golang.org/api v0.44.0-impersonate-preview
	google.golang.org/api v0.45.0
	google.golang.org/api v0.46.0
	google.golang.org/api v0.47.0
	google.golang.org/api v0.48.0
	google.golang.org/api v0.49.0
	google.golang.org/api v0.50.0
	google.golang.org/api v0.51.0
)

replace google.golang.org/grpc v1.14.0 => github.com/bradfitz/grpc-go v0.0.0-20170203184515-188a132adcfb

replace bazil.org/fuse => bazil.org/fuse v0.0.0-20180421153158-65cc252bf669 // pin to latest version that supports macOS. see https://github.com/bazil/fuse/issues/224
