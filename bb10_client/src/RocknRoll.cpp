// Navigation pane project template
#include "RocknRoll.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/SceneCover>
<<<<<<< HEAD
#include <QTimer>
=======
#include <bb/cascades/ListView>
#include <QNetworkAccessManager>
#include <QUrl>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QDebug>
#include <bb/data/JsonDataAccess>
>>>>>>> 68d84268428a73135d06b21a5d5c1ab1726d719a

#include "albumsmodel.hpp"
#include "songsmodel.hpp"

using namespace bb::cascades;
using namespace bb::data;

RocknRoll::RocknRoll(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    AlbumsDataModel *p1DataModel = new AlbumsDataModel(this);
    SongsDataModel *p2DataModel = new SongsDataModel(this);
    qml->setContextProperty("_model1", p1DataModel);
    qml->setContextProperty("_model2", p2DataModel);

    qmlRegisterType<QTimer>("QTimer", 1, 0, "QTimer");
    qmlRegisterType<SceneCover>("bb.cascades", 1, 0, "SceneCover");
    qmlRegisterUncreatableType<AbstractCover>("bb.cascades", 1, 0, "AbstractCover", "An AbstractCover cannot be created.");

    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    // set created root object as a scene
    app->setScene(root);

    startNetworkManager();
    //parseJSON();
}

void RocknRoll::parseJSON(){
	GroupDataModel *model = new GroupDataModel(QStringList() << "artist" << "song" << "genre" << "year");

	JsonDataAccess jda;
	QVariant list = jda.load("dummy.json");

	model->insertList(list.value<QVariantList>());

	ListView *listView = new ListView();
	listView->setDataModel(model);
}

void RocknRoll::startNetworkManager()
{
	QNetworkAccessManager* nam = new QNetworkAccessManager();
	if(!nam)
	{
		emit complete("unable to create QNetworkAccessManager", false);
		return;
	}

	QString queryUri = "http://gdata.youtube.com/feeds/api/standardfeeds/most_popular?v=2&alt=json";
	QUrl url(queryUri);

	QNetworkRequest req(url);

	QNetworkReply* ipReply = nam->get(req);
	connect(ipReply, SIGNAL(finished(QNetworkReply*)), this, SLOT(onArtistReply(QNetworkReply*)));
}

void RocknRoll::onArtistReply(QNetworkReply* reply)
{
	QString response;
	bool success = false;
	if(reply)
	{
		if(reply->error() == QNetworkReply::NoError)
		{
			//int available = reply->bytesAvailable();
			QString jString = reply->readAll();
			JsonDataAccess jda;
			QVariantList list = jda.loadFromBuffer(jString)->toValue<QVariantList>();
			/*if (available > 0)
			{
				int bufSize = sizeof(char) * available + sizeof(char);
				QByteArray buffer(bufSize, 0);
				int read = reply->read(buffer.data(), available);
				response = QString(buffer);
				//QJsonDocument jdoc = response.toJson();
				//qDebug() << "****** " << response << " ******" << endl;
				//JsonDataAccess jda;
				//QVariant list = jda.load("/bb10_client/dummy.json");
				//QVariant jdoc = jda.loadFromBuffer(response);
				//QList<QVariant> list = jdoc.toList();
				//qDebug() << "null jdoc: " << jdoc.isNull() << endl;
				//qDebug() << "empty jdoc: " << jdoc.isEmpty() << endl;
				success = true;
			}*/
		}
		else
		{
			response = QString("Error: ") + reply->errorString() + QString(" status: ") + reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toString();
			qDebug() << response;
		}
		reply->deleteLater();
	}
	if (response.trimmed().isEmpty())
	{
		response = QString("Request failed. Check connection");
		qDebug() << response;
	}
	emit complete(response, success);

}
