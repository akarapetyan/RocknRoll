#include <bb/data/JsonDataAccess>

#include "songsmodel.hpp"

using namespace bb::cascades;
using namespace bb::data;

SongsDataModel::SongsDataModel(QObject *parent)
    : bb::cascades::GroupDataModel(parent)
{
}

void SongsDataModel::updateList()
{
	QDir dir = QDir::home();
	if (dir.cd("songs")) {
		QStringList listOfFiles = dir.entryList(QDir::Dirs);
		for (int i = 0; i < listOfFiles.size() - 2; i++) {
			QVariantList indexPath;
			indexPath << i;
			emit itemUpdated(indexPath);
		}
	}
//	QList <QVariantMap> tmp = toListOfMaps();
//	clear();
//	blockSignals(false);
//	insertList(tmp);
}

int SongsDataModel::getItemsCount(const QString &strAlbumName)
{
	QDir dir = QDir::home();
	if (dir.cd("songs")) {
		if (dir.cd(strAlbumName)) {
			QStringList listOfFiles = dir.entryList(QDir::Files);
			return listOfFiles.count();
		}
	}
	return 0;
}

int SongsDataModel::childCount(const QVariantList& indexPath)
{
    return 125;
 	QDir dir = QDir::home();
	if (dir.cd("songs")) {
		QStringList listOfFiles = dir.entryList(QDir::Dirs);
		return listOfFiles.count() - 2;
	}
    // The number of child items for 2nd level items is requested -> always 0
    return 0;
}

bool SongsDataModel::hasChildren(const QVariantList& indexPath)
{
	return false;
}

QVariant SongsDataModel::setupAlbumListModel()
{
    // Create a new GroupDataModel; the GroupDataModel is a helper class that ListView uses for data handling.
    // It uses in-memory storage so we can populate data.
    // We load the GroupDataModel with help from the JsonDataAcces function, load().
    JsonDataAccess jda;
    QDir home = QDir::home();
    QVariantMap existingAlbums = jda.load(home.absoluteFilePath("albumslist.json")).value<QVariantMap>();
    if (jda.hasError()) {
        bb::data::DataAccessError error = jda.error();
        qDebug() << "JSON loading error: " << error.errorType() << ": " << error.errorMessage();
        return QVariant();
    }

    // Sort on region in the model so we will get different categories.
    //m_albumsModel->insertList(existingAlbums);
    return existingAlbums;
}

QVariant SongsDataModel::data(const QVariantList& indexPath)
{
	QVariantMap data;
	QDir dir = QDir::home();
	if (dir.cd("songs")) {
		QStringList listOfFiles = dir.entryList(QDir::Dirs);
		listOfFiles.removeOne(".");
		listOfFiles.removeOne("..");
//		data["albumName"] = listOfFiles.at(indexPath[0].toInt());
//		data["itemsCount"] = getItemsCount(listOfFiles.at(indexPath[0].toInt()));
		data["albumName"] = "songs";
		//data["itemsCount"] = getItemsCount(listOfFiles.at(indexPath[0].toInt()));
	}
	return data;
}

QString SongsDataModel::itemType(const QVariantList& indexPath)
{
	return QLatin1String("item");
}
