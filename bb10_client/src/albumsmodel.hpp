#ifndef ALBUMSMODEL_HPP
#define ALBUMSMODEL_HPP

#include <QObject>
#include <bb/cascades/GroupDataModel>


class AlbumsDataModel : public bb::cascades::GroupDataModel
{
    Q_OBJECT
public:
    AlbumsDataModel(QObject *parent = 0);

    // Required interface implementation
    virtual int childCount(const QVariantList& indexPath);
    virtual bool hasChildren(const QVariantList& indexPath);
    virtual QVariant data(const QVariantList& indexPath);
    virtual QString itemType(const QVariantList& indexPath);

    void updateList();
private:
    QVariant setupAlbumListModel();
    int getItemsCount(const QString &strAlbumName);
};

#endif

