package tvs.com.web.pojo;

import java.io.Serializable;

import java.lang.reflect.Field;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

public class ContentItem implements Serializable, Comparable<ContentItem> {
    {
    }


    //    private Date testDate = Calendar.getInstance().getTime();
    private Boolean isChecked;
    private String xCollectionID; // parent folder
    private String dID;
    private String dDocName;
    private String dOriginalName; // t�n file g?c khi upload - d�ng hi?n th?
    private String dWebFilename;
    private String dFormat;
    private String dFileSize; // file size - d�ng hi?n th?
    private String dFileSizeHumanReadable;
    private String dExtension;
    private String dWebURL;
    private String docUrl;
    private String URL;
    private String dDocTitle;
    private String dDocAuthor;
    private String dDocType;
    private Date dCreateDate;
    private Date dReleaseDate; // release date -- d�ng hi?n th?
    private Boolean dIsCheckedOut;
    private String dStatus;
    private Date dDocCreatedDate;
    private String dDocCreator;
    //    private Date dDocLastModIfiedDates;
    private String dDocLastModifier;
    private String dDocOwner;
    private String dIdcProfile;
    private String xExternalDataSet;
    private String dDocFunction;
    private String xTemplateType;
    private String xStorageRule;
    private String xComments;
    private String xmSolandoc;

    private String dRevClassID;
    private String dRevisionID;
    private String dRevLabel;
    private String dCheckoutUser;
    private String dSecurityGroup;
    private String dInDate;
    private String dOutDate;
    private String dReleaseState;
    private String dFlag1;
    private String dWebExtension;
    private String dProcessingState;
    private String dMessage;
    private String dDocAccount;
    private String dRendition1;
    private String dRendition2;
    private String dIndexErState;
    private String dPublishType;
    private String dPublishState;
    private String dWorkflowState;
    private String dRevRank;
    private String dDocID;
    private String dIsPrimary;
    private String dIsWebFormat;
    private String dLocation;
    private String dLanguage;
    private String dCharacterSet;
    private String xPartitionId;
    private String xWebFlag;
    private String xHidden;
    private String xReadOnly;
    private String xInhibitUpdate;
    private String xForceFolderSecurity;
    private String xDamConversionType;
    private String xPackagedConversions;
    private String xVideoRenditions;
    private String dIndexedID;
    private String dDocFormats;

    private String xmAnhdaidien;
    private String xmChuyenmuc;
    private String xmMuchienthi;
    private String xmTacgia;
    private String xmDongsukien;

    private Date xmNgayxuatban;
    private Date xmNgayhethan;

    private String xmNguoitao;
    private Date xmNgaytao;
    private String xmNguoisua;
    private Date xmNgaysua;
    //    private Date xmNgaytaodate;

    private String xmNguoiduyet;
    private String xmNgonngu;
    private String xmNhomlienket;
    private String xmUrl;
    //    private String xmHotenDocgia;
    private String xmEmail;
    private String xmdiachi;
    private String xmTrangthai;
    private String xmXoa;
    //    private String xmNguoitraloi;
    //    private String xmNgaytraloi;
    //    private String xmMatraloi;
    //    private String xmMacauhoi;
    //    private String xmChuyenmuchoidap;
    //    private String xmdIenthoai;
    private String xmTeptindinhkem;
    //    private String xmTenteptindInhkem;
    private String xmNguoitaophienban;

    //    private String dDocLastModIfiedDate;
    private String wfQueueActionState;
    private Boolean isSelect;
    private String dWfStepName;

    private String isCancelApprove;
    private String xmUrldOwnload;
    private String wfMessage;
    private String xIPMSYS_APP_ID;
    private String xIPMSYS_BATCH_ID1;
    //    private String xmSoluongview;
    private String xIPMSYS_STATUS;
    private String xIPMSYS_REDACTION;
    //    private String xmTrangthaiHoidap;
    //    private String xmdInhHoidap;
    //    private String xmHoidap;
    private String xIPMSYS_PARENT_ID;
    private String xIPMSYS_BATCH_SEQ;
    //    private String xmSoluongbinhluan;
    private String xmMotatomtat;
    private String xIPMSYS_SCKEY;


    //xmHoidap,xIPMSYS_PARENT_ID,xIPMSYS_BATCH_SEQ,xmSoluongbinhluan,xmMotatomtat,xIPMSYS_SCKEY,

    private Boolean dRead;
    private Boolean dWrite;
    private Boolean dDelete;
    private Boolean dAdmin;
    private Boolean ishidden;
    private Boolean isreadOnly;
    //Thong tin dau thau content
    private String xmTengoithau;
    private String xmTenbenmoithau;

    // content's shortcut info
    private Boolean isLink;
    private Date dLinkCreateDate;
    private String dLinkID; // = 6
    private String dLinkItemID; // = 106680019494000203
    private String dLinkName; //= Shortcut to Kho noi dung so 2
    private String dLinkOwner; // = weblogic
    private String dLinkType; // = 1
    private String dDescription;

    private Set<RevisionHistoryItem> revisionHistory;
    private WfDocInfo wfDocInfo;
    private WorkflowStep workflowStep;
    private Map<String, Boolean> actions;

    private String thumbImageUrl;
    private String webImageUrl;
    private String xmDonvi;
    private String xmSoluonganh;
    private String xmSoluongchu;
    private String xmSotrang;
    private String xmTacgiaanh;
    private String xmNguoibientap;
    private String xmNguoitaolap;
    private String xmBinhluan;

    public ContentItem() {
        this.isChecked = false;
        this.dIsCheckedOut = false;
        this.isLink = false;
        this.dRead = false;
        this.dDelete = false;
        this.dWrite = false;
        this.dAdmin = false;
        this.isSelect = false;
        this.revisionHistory = new HashSet<RevisionHistoryItem>();
        this.actions = new HashMap<String, Boolean>();
    }


    public void setXmSoluonganh(String xmSoluonganh) {
        this.xmSoluonganh = xmSoluonganh;
    }

    public String getXmSoluonganh() {
        return xmSoluonganh;
    }

    public void setXmSoluongchu(String xmSoluongchu) {
        this.xmSoluongchu = xmSoluongchu;
    }

    public String getXmSoluongchu() {
        return xmSoluongchu;
    }

    public void setXmSotrang(String xmSotrang) {
        this.xmSotrang = xmSotrang;
    }

    public String getXmSotrang() {
        return xmSotrang;
    }

    public void setXmTacgiaanh(String xmTacgiaanh) {
        this.xmTacgiaanh = xmTacgiaanh;
    }

    public String getXmTacgiaanh() {
        return xmTacgiaanh;
    }

    public void setXmNguoibientap(String xmNguoibientap) {
        this.xmNguoibientap = xmNguoibientap;
    }

    public String getXmNguoibientap() {
        return xmNguoibientap;
    }

    public void setXmNguoitaolap(String xmNguoitaolap) {
        this.xmNguoitaolap = xmNguoitaolap;
    }

    public String getXmNguoitaolap() {
        return xmNguoitaolap;
    }

    public void setIsChecked(Boolean isChecked) {
        this.isChecked = isChecked;
    }

    public Boolean getIsChecked() {
        return isChecked;
    }

    public void setxCollectionID(String xCollectionID) {
        this.xCollectionID = xCollectionID;
    }

    public String getxCollectionID() {
        return xCollectionID;
    }

    public void setdID(String dID) {
        this.dID = dID;
    }

    public String getdID() {
        return dID;
    }

    public void setdDocName(String dDocName) {
        this.dDocName = dDocName;
    }

    public String getdDocName() {
        return dDocName;
    }

    public void setdOriginalName(String dOriginalName) {
        this.dOriginalName = dOriginalName;
    }

    public String getdOriginalName() {
        return dOriginalName;
    }

    public void setdWebFilename(String dWebFilename) {
        this.dWebFilename = dWebFilename;
    }

    public String getdWebFilename() {
        return dWebFilename;
    }

    public void setdFormat(String dFormat) {
        this.dFormat = dFormat;
    }

    public String getdFormat() {
        return dFormat;
    }

    public void setdFileSize(String dFileSize) {
        this.dFileSize = dFileSize;
    }

    public String getdFileSize() {
        return dFileSize;
    }

    public void setdExtension(String dExtension) {
        this.dExtension = dExtension;
    }

    public String getdExtension() {
        return dExtension;
    }

    public void setdWebURL(String dWebURL) {
        this.dWebURL = dWebURL;
    }

    public String getdWebURL() {
        return dWebURL;
    }

    public void setDocUrl(String DocUrl) {
        this.docUrl = DocUrl;
    }

    public String getDocUrl() {
        return docUrl;
    }

    public void setdDocTitle(String dDocTitle) {
        this.dDocTitle = dDocTitle;
    }

    public String getdDocTitle() {
        return dDocTitle;
    }

    public void setdDocAuthor(String dDocAuthor) {
        this.dDocAuthor = dDocAuthor;
    }

    public String getdDocAuthor() {
        return dDocAuthor;
    }

    public void setdDocType(String dDocType) {
        this.dDocType = dDocType;
    }

    public String getdDocType() {
        return dDocType;
    }

    public void setdCreateDate(Date dCreateDate) {
        this.dCreateDate = dCreateDate;
    }

    public Date getdCreateDate() {
        return dCreateDate;
    }

    public void setdReleaseDate(Date dReleaseDate) {
        this.dReleaseDate = dReleaseDate;
    }

    public Date getdReleaseDate() {
        return dReleaseDate;
    }

    public void setdIsCheckedOut(Boolean dIsCheckedOut) {
        this.dIsCheckedOut = dIsCheckedOut;
    }

    public Boolean getdIsCheckedOut() {
        return dIsCheckedOut;
    }

    public void setdStatus(String dStatus) {
        this.dStatus = dStatus;
    }

    public String getdStatus() {
        return dStatus;
    }

    public void setdDocCreatedDate(Date dDocCreatedDate) {
        this.dDocCreatedDate = dDocCreatedDate;
    }

    public Date getdDocCreatedDate() {
        return dDocCreatedDate;
    }

    public void setdDocCreator(String dDocCreator) {
        this.dDocCreator = dDocCreator;
    }

    public String getdDocCreator() {
        return dDocCreator;
    }

    //    public void setdDocLastModIfiedDates(Date dDocLastModIfiedDates) {
    //        this.dDocLastModIfiedDates = dDocLastModIfiedDates;
    //    }
    //
    //    public Date getdDocLastModIfiedDates() {
    //        return dDocLastModIfiedDates;
    //    }

    public void setdDocLastModifier(String dDocLastModifier) {
        this.dDocLastModifier = dDocLastModifier;
    }

    public String getdDocLastModifier() {
        return dDocLastModifier;
    }

    public void setdDocOwner(String dDocOwner) {
        this.dDocOwner = dDocOwner;
    }

    public String getdDocOwner() {
        return dDocOwner;
    }

    public void setdIdcProfile(String dIdcProfile) {
        this.dIdcProfile = dIdcProfile;
    }

    public String getdIdcProfile() {
        return dIdcProfile;
    }

    public void setxExternalDataSet(String xExternalDataSet) {
        this.xExternalDataSet = xExternalDataSet;
    }

    public String getxExternalDataSet() {
        return xExternalDataSet;
    }

    public void setdDocFunction(String dDocFunction) {
        this.dDocFunction = dDocFunction;
    }

    public String getdDocFunction() {
        return dDocFunction;
    }

    public void setxTemplateType(String xTemplateType) {
        this.xTemplateType = xTemplateType;
    }

    public String getxTemplateType() {
        return xTemplateType;
    }

    public void setxStorageRule(String xStorageRule) {
        this.xStorageRule = xStorageRule;
    }

    public String getxStorageRule() {
        return xStorageRule;
    }

    public void setxComments(String xComments) {
        this.xComments = xComments;
    }

    public String getxComments() {
        return xComments;
    }

    public void setdRevClassID(String dRevClassID) {
        this.dRevClassID = dRevClassID;
    }

    public String getdRevClassID() {
        return dRevClassID;
    }

    public void setdRevisionID(String dRevisionID) {
        this.dRevisionID = dRevisionID;
    }

    public String getdRevisionID() {
        return dRevisionID;
    }

    public void setdRevLabel(String dRevLabel) {
        this.dRevLabel = dRevLabel;
    }

    public String getdRevLabel() {
        return dRevLabel;
    }

    public void setdCheckoutUser(String dCheckoutUser) {
        this.dCheckoutUser = dCheckoutUser;
    }

    public String getdCheckoutUser() {
        return dCheckoutUser;
    }

    public void setdSecurityGroup(String dSecurityGroup) {
        this.dSecurityGroup = dSecurityGroup;
    }

    public String getdSecurityGroup() {
        return dSecurityGroup;
    }

    public void setdInDate(String dInDate) {
        this.dInDate = dInDate;
    }

    public String getdInDate() {
        return dInDate;
    }

    public void setdOutDate(String dOutDate) {
        this.dOutDate = dOutDate;
    }

    public String getdOutDate() {
        return dOutDate;
    }

    public void setdReleaseState(String dReleaseState) {
        this.dReleaseState = dReleaseState;
    }

    public String getdReleaseState() {
        return dReleaseState;
    }

    public void setdFlag1(String dFlag1) {
        this.dFlag1 = dFlag1;
    }

    public String getdFlag1() {
        return dFlag1;
    }

    public void setdWebExtension(String dWebExtension) {
        this.dWebExtension = dWebExtension;
    }

    public String getdWebExtension() {
        return dWebExtension;
    }

    public void setdProcessingState(String dProcessingState) {
        this.dProcessingState = dProcessingState;
    }

    public String getdProcessingState() {
        return dProcessingState;
    }

    public void setdMessage(String dMessage) {
        this.dMessage = dMessage;
    }

    public String getdMessage() {
        return dMessage;
    }

    public void setdDocAccount(String dDocAccount) {
        this.dDocAccount = dDocAccount;
    }

    public String getdDocAccount() {
        return dDocAccount;
    }

    public void setdRendition1(String dRendition1) {
        this.dRendition1 = dRendition1;
    }

    public String getdRendition1() {
        return dRendition1;
    }

    public void setdRendition2(String dRendition2) {
        this.dRendition2 = dRendition2;
    }

    public String getdRendition2() {
        return dRendition2;
    }

    public void setdIndexErState(String dIndexErState) {
        this.dIndexErState = dIndexErState;
    }

    public String getdIndexErState() {
        return dIndexErState;
    }

    public void setdPublishType(String dPublishType) {
        this.dPublishType = dPublishType;
    }

    public String getdPublishType() {
        return dPublishType;
    }

    public void setdPublishState(String dPublishState) {
        this.dPublishState = dPublishState;
    }

    public String getdPublishState() {
        return dPublishState;
    }

    public void setdWorkflowState(String dWorkflowState) {
        this.dWorkflowState = dWorkflowState;
    }

    public String getdWorkflowState() {
        return dWorkflowState;
    }

    public void setdRevRank(String dRevRank) {
        this.dRevRank = dRevRank;
    }

    public String getdRevRank() {
        return dRevRank;
    }

    public void setdDocID(String dDocID) {
        this.dDocID = dDocID;
    }

    public String getdDocID() {
        return dDocID;
    }

    public void setdIsPrimary(String dIsPrimary) {
        this.dIsPrimary = dIsPrimary;
    }

    public String getdIsPrimary() {
        return dIsPrimary;
    }

    public void setdIsWebFormat(String dIsWebFormat) {
        this.dIsWebFormat = dIsWebFormat;
    }

    public String getdIsWebFormat() {
        return dIsWebFormat;
    }

    public void setdLocation(String dLocation) {
        this.dLocation = dLocation;
    }

    public String getdLocation() {
        return dLocation;
    }

    public void setdLanguage(String dLanguage) {
        this.dLanguage = dLanguage;
    }

    public String getdLanguage() {
        return dLanguage;
    }

    public void setdCharacterSet(String dCharacterSet) {
        this.dCharacterSet = dCharacterSet;
    }

    public String getdCharacterSet() {
        return dCharacterSet;
    }

    public void setxPartitionId(String xPartitionId) {
        this.xPartitionId = xPartitionId;
    }

    public String getxPartitionId() {
        return xPartitionId;
    }

    public void setxWebFlag(String xWebFlag) {
        this.xWebFlag = xWebFlag;
    }

    public String getxWebFlag() {
        return xWebFlag;
    }

    public void setxHidden(String xHidden) {
        this.xHidden = xHidden;
    }

    public String getxHidden() {
        return xHidden;
    }

    public void setxReadOnly(String xReadOnly) {
        this.xReadOnly = xReadOnly;
    }

    public String getxReadOnly() {
        return xReadOnly;
    }

    public void setxInhibitUpdate(String xInhibitUpdate) {
        this.xInhibitUpdate = xInhibitUpdate;
    }

    public String getxInhibitUpdate() {
        return xInhibitUpdate;
    }

    public void setxForceFolderSecurity(String xForceFolderSecurity) {
        this.xForceFolderSecurity = xForceFolderSecurity;
    }

    public String getxForceFolderSecurity() {
        return xForceFolderSecurity;
    }

    public void setxDamConversionType(String xDamConversionType) {
        this.xDamConversionType = xDamConversionType;
    }

    public String getxDamConversionType() {
        return xDamConversionType;
    }

    public void setxPackagedConversions(String xPackagedConversions) {
        this.xPackagedConversions = xPackagedConversions;
    }

    public String getxPackagedConversions() {
        return xPackagedConversions;
    }

    public void setxVideoRenditions(String xVideoRenditions) {
        this.xVideoRenditions = xVideoRenditions;
    }

    public String getxVideoRenditions() {
        return xVideoRenditions;
    }

    public void setdIndexedID(String dIndexedID) {
        this.dIndexedID = dIndexedID;
    }

    public String getdIndexedID() {
        return dIndexedID;
    }

    public void setdDocFormats(String dDocFormats) {
        this.dDocFormats = dDocFormats;
    }

    public String getdDocFormats() {
        return dDocFormats;
    }

    public void setxmAnhdaidien(String xmAnhdaidien) {
        this.xmAnhdaidien = xmAnhdaidien;
    }

    public String getxmAnhdaidien() {
        return xmAnhdaidien;
    }

    public void setXmChuyenmuc(String xmChuyenmuc) {
        this.xmChuyenmuc = xmChuyenmuc;
    }

    public String getXmChuyenmuc() {
        return xmChuyenmuc;
    }

    public void setXmMuchienthi(String xmMuchienthi) {
        this.xmMuchienthi = xmMuchienthi;
    }

    public String getXmMuchienthi() {
        return xmMuchienthi;
    }

    public void setXmTacgia(String xmTacgia) {
        this.xmTacgia = xmTacgia;
    }

    public String getXmTacgia() {
        return xmTacgia;
    }

    public void setXmNgayxuatban(Date xmNgayxuatban) {
        this.xmNgayxuatban = xmNgayxuatban;
    }

    public Date getXmNgayxuatban() {
        return xmNgayxuatban;
    }

    public void setXmNgayhethan(Date xmNgayhethan) {
        this.xmNgayhethan = xmNgayhethan;
    }

    public Date getXmNgayhethan() {
        return xmNgayhethan;
    }

    public void setXmNguoitao(String xmNguoitao) {
        this.xmNguoitao = xmNguoitao;
    }

    public String getXmNguoitao() {
        return xmNguoitao;
    }

    public void setXmNgaytao(Date xmNgaytao) {
        this.xmNgaytao = xmNgaytao;
    }

    public Date getXmNgaytao() {
        return xmNgaytao;
    }

    public void setXmNguoisua(String xmNguoisua) {
        this.xmNguoisua = xmNguoisua;
    }

    public String getXmNguoisua() {
        return xmNguoisua;
    }

    public void setXmNgaysua(Date xmNgaysua) {
        this.xmNgaysua = xmNgaysua;
    }

    public Date getXmNgaysua() {
        return xmNgaysua;
    }

    //    public void setXmNgaytaodate(Date xmNgaytaodate) {
    //        this.xmNgaytaodate = xmNgaytaodate;
    //    }
    //
    //    public Date getXmNgaytaodate() {
    //        return xmNgaytaodate;
    //    }

    public void setXmNguoiduyet(String xmNguoiduyet) {
        this.xmNguoiduyet = xmNguoiduyet;
    }

    public String getXmNguoiduyet() {
        return xmNguoiduyet;
    }

    public void setXmNgonngu(String xmNgonngu) {
        this.xmNgonngu = xmNgonngu;
    }

    public String getXmNgonngu() {
        return xmNgonngu;
    }

    public void setXmNhomlienket(String xmNhomlienket) {
        this.xmNhomlienket = xmNhomlienket;
    }

    public String getXmNhomlienket() {
        return xmNhomlienket;
    }

    public void setXmUrl(String xmUrl) {
        this.xmUrl = xmUrl;
    }

    public String getXmUrl() {
        return xmUrl;
    }

    //    public void setXmHotenDocgia(String xmHotenDocgia) {
    //        this.xmHotenDocgia = xmHotenDocgia;
    //    }
    //
    //    public String getXmHotenDocgia() {
    //        return xmHotenDocgia;
    //    }

    public void setXmEmail(String xmEmail) {
        this.xmEmail = xmEmail;
    }

    public String getXmEmail() {
        return xmEmail;
    }

    public void setxmdiachi(String xmdiachi) {
        this.xmdiachi = xmdiachi;
    }

    public String getxmdiachi() {
        return xmdiachi;
    }

    public void setXmTrangthai(String xmTrangthai) {
        this.xmTrangthai = xmTrangthai;
    }

    public String getXmTrangthai() {
        return xmTrangthai;
    }
    //
    //    public void setXmNguoitraloi(String xmNguoitraloi) {
    //        this.xmNguoitraloi = xmNguoitraloi;
    //    }
    //
    //    public String getXmNguoitraloi() {
    //        return xmNguoitraloi;
    //    }

    //    public void setXmNgaytraloi(String xmNgaytraloi) {
    //        this.xmNgaytraloi = xmNgaytraloi;
    //    }
    //
    //    public String getXmNgaytraloi() {
    //        return xmNgaytraloi;
    //    }
    //
    //    public void setXmMatraloi(String xmMatraloi) {
    //        this.xmMatraloi = xmMatraloi;
    //    }
    //
    //    public String getXmMatraloi() {
    //        return xmMatraloi;
    //    }
    //
    //    public void setXmMacauhoi(String xmMacauhoi) {
    //        this.xmMacauhoi = xmMacauhoi;
    //    }

    //    public String getXmMacauhoi() {
    //        return xmMacauhoi;
    //    }
    //
    //    public void setXmChuyenmuchoidap(String xmChuyenmuchoidap) {
    //        this.xmChuyenmuchoidap = xmChuyenmuchoidap;
    //    }
    //
    //    public String getXmChuyenmuchoidap() {
    //        return xmChuyenmuchoidap;
    //    }

    //    public void setXmdIenthoai(String xmdIenthoai) {
    //        this.xmdIenthoai = xmdIenthoai;
    //    }
    //
    //    public String getXmdIenthoai() {
    //        return xmdIenthoai;
    //    }

    public void setxmTeptindinhkem(String xmTeptindinhkem) {
        this.xmTeptindinhkem = xmTeptindinhkem;
    }

    public String getxmTeptindinhkem() {
        return xmTeptindinhkem;
    }

    //    public void setXmTenteptindInhkem(String xmTenteptindInhkem) {
    //        this.xmTenteptindInhkem = xmTenteptindInhkem;
    //    }
    //
    //    public String getXmTenteptindInhkem() {
    //        return xmTenteptindInhkem;
    //    }

    public void setXmNguoitaophienban(String xmNguoitaophienban) {
        this.xmNguoitaophienban = xmNguoitaophienban;
    }

    public String getXmNguoitaophienban() {
        return xmNguoitaophienban;
    }

    //    public void setdDocLastModIfiedDate(String dDocLastModIfiedDate) {
    //        this.dDocLastModIfiedDate = dDocLastModIfiedDate;
    //    }
    //
    //    public String getdDocLastModIfiedDate() {
    //        return dDocLastModIfiedDate;
    //    }

    public void setWfQueueActionState(String wfQueueActionState) {
        this.wfQueueActionState = wfQueueActionState;
    }

    public String getWfQueueActionState() {
        return wfQueueActionState;
    }

    public void setIsSelect(Boolean isSelect) {
        this.isSelect = isSelect;
    }

    public Boolean getIsSelect() {
        return isSelect;
    }

    public void setdWfStepName(String dWfStepName) {
        this.dWfStepName = dWfStepName;
    }

    public String getdWfStepName() {
        return dWfStepName;
    }

    public void setIsCancelApprove(String isCancelApprove) {
        this.isCancelApprove = isCancelApprove;
    }

    public String getIsCancelApprove() {
        return isCancelApprove;
    }

    public void setXmUrldOwnload(String xmUrldOwnload) {
        this.xmUrldOwnload = xmUrldOwnload;
    }

    public String getXmUrldOwnload() {
        return xmUrldOwnload;
    }

    public void setWfMessage(String wfMessage) {
        this.wfMessage = wfMessage;
    }

    public String getWfMessage() {
        return wfMessage;
    }

    public void setxIPMSYS_APP_ID(String xIPMSYS_APP_ID) {
        this.xIPMSYS_APP_ID = xIPMSYS_APP_ID;
    }

    public String getxIPMSYS_APP_ID() {
        return xIPMSYS_APP_ID;
    }

    public void setxIPMSYS_BATCH_ID1(String xIPMSYS_BATCH_ID1) {
        this.xIPMSYS_BATCH_ID1 = xIPMSYS_BATCH_ID1;
    }

    public String getxIPMSYS_BATCH_ID1() {
        return xIPMSYS_BATCH_ID1;
    }

    //    public void setXmSoluongview(String xmSoluongview) {
    //        this.xmSoluongview = xmSoluongview;
    //    }
    //
    //    public String getXmSoluongview() {
    //        return xmSoluongview;
    //    }

    public void setxIPMSYS_STATUS(String xIPMSYS_STATUS) {
        this.xIPMSYS_STATUS = xIPMSYS_STATUS;
    }

    public String getxIPMSYS_STATUS() {
        return xIPMSYS_STATUS;
    }

    public void setxIPMSYS_REDACTION(String xIPMSYS_REDACTION) {
        this.xIPMSYS_REDACTION = xIPMSYS_REDACTION;
    }

    public String getxIPMSYS_REDACTION() {
        return xIPMSYS_REDACTION;
    }

    //    public void setXmTrangthaiHoidap(String xmTrangthaiHoidap) {
    //        this.xmTrangthaiHoidap = xmTrangthaiHoidap;
    //    }
    //
    //    public String getXmTrangthaiHoidap() {
    //        return xmTrangthaiHoidap;
    //    }

    //    public void setXmdInhHoidap(String xmdInhHoidap) {
    //        this.xmdInhHoidap = xmdInhHoidap;
    //    }
    //
    //    public String getXmdInhHoidap() {
    //        return xmdInhHoidap;
    //    }
    //
    //    public void setXmHoidap(String xmHoidap) {
    //        this.xmHoidap = xmHoidap;
    //    }
    //
    //    public String getXmHoidap() {
    //        return xmHoidap;
    //    }

    public void setxIPMSYS_PARENT_ID(String xIPMSYS_PARENT_ID) {
        this.xIPMSYS_PARENT_ID = xIPMSYS_PARENT_ID;
    }

    public String getxIPMSYS_PARENT_ID() {
        return xIPMSYS_PARENT_ID;
    }

    public void setxIPMSYS_BATCH_SEQ(String xIPMSYS_BATCH_SEQ) {
        this.xIPMSYS_BATCH_SEQ = xIPMSYS_BATCH_SEQ;
    }

    public String getxIPMSYS_BATCH_SEQ() {
        return xIPMSYS_BATCH_SEQ;
    }

    //    public void setXmSoluongbinhluan(String xmSoluongbinhluan) {
    //        this.xmSoluongbinhluan = xmSoluongbinhluan;
    //    }
    //
    //    public String getXmSoluongbinhluan() {
    //        return xmSoluongbinhluan;
    //    }

    public void setXmMotatomtat(String xmMotatomtat) {
        this.xmMotatomtat = xmMotatomtat;
    }

    public String getXmMotatomtat() {
        return xmMotatomtat;
    }

    public void setxIPMSYS_SCKEY(String xIPMSYS_SCKEY) {
        this.xIPMSYS_SCKEY = xIPMSYS_SCKEY;
    }

    public String getxIPMSYS_SCKEY() {
        return xIPMSYS_SCKEY;
    }

    public void setdRead(Boolean dRead) {
        this.dRead = dRead;
    }

    public Boolean getdRead() {
        return dRead;
    }

    public void setdWrite(Boolean dWrite) {
        this.dWrite = dWrite;
    }

    public Boolean getdWrite() {
        return dWrite;
    }

    public void setdDelete(Boolean dDelete) {
        this.dDelete = dDelete;
    }

    public Boolean getdDelete() {
        return dDelete;
    }

    public void setdAdmin(Boolean dAdmin) {
        this.dAdmin = dAdmin;
    }

    public Boolean getdAdmin() {
        return dAdmin;
    }

    public void setIshidden(Boolean ishidden) {
        this.ishidden = ishidden;
    }

    public Boolean getishidden() {
        return ishidden;
    }

    public void setIsreadOnly(Boolean isreadOnly) {
        this.isreadOnly = isreadOnly;
    }

    public Boolean getIsreadOnly() {
        return isreadOnly;
    }

    public void setIsLink(Boolean isLink) {
        this.isLink = isLink;
    }

    public Boolean getIsLink() {
        return isLink;
    }

    public void setdLinkCreateDate(Date dLinkCreateDate) {
        this.dLinkCreateDate = dLinkCreateDate;
    }

    public Date getdLinkCreateDate() {
        return dLinkCreateDate;
    }

    public void setdLinkID(String dLinkID) {
        this.dLinkID = dLinkID;
    }

    public String getdLinkID() {
        return dLinkID;
    }

    public void setdLinkItemID(String dLinkItemID) {
        this.dLinkItemID = dLinkItemID;
    }

    public String getdLinkItemID() {
        return dLinkItemID;
    }

    public void setdLinkName(String dLinkName) {
        this.dLinkName = dLinkName;
    }

    public String getdLinkName() {
        return dLinkName;
    }

    public void setdLinkOwner(String dLinkOwner) {
        this.dLinkOwner = dLinkOwner;
    }

    public String getdLinkOwner() {
        return dLinkOwner;
    }

    public void setdLinkType(String dLinkType) {
        this.dLinkType = dLinkType;
    }

    public String getdLinkType() {
        return dLinkType;
    }

    public void setRevisionHistory(Set<RevisionHistoryItem> revisionHistory) {
        this.revisionHistory = revisionHistory;
    }

    public Set<RevisionHistoryItem> getRevisionHistory() {
        return revisionHistory;
    }

    public void setWfDocInfo(WfDocInfo wfDocInfo) {
        this.wfDocInfo = wfDocInfo;
    }

    public WfDocInfo getWfDocInfo() {
        return wfDocInfo;
    }

    public void setWorkflowStep(WorkflowStep workflowStep) {
        this.workflowStep = workflowStep;
    }

    public WorkflowStep getWorkflowStep() {
        return workflowStep;
    }

    public void setActions(Map<String, Boolean> actions) {
        this.actions = actions;
    }

    public Map<String, Boolean> getActions() {
        return actions;
    }

    public void setdFileSizeHumanReadable(String dFileSizeHumanReadable) {
        this.dFileSizeHumanReadable = dFileSizeHumanReadable;
    }

    public String getdFileSizeHumanReadable() {
        long size = 0L;
        try {
            size = Long.parseLong(this.dFileSize);

        } catch (Exception e) {
        }
        //        return dFileSizeHumanReadable;
        return FileUtils.byteCountToDisplaySize(size);
    }

    //    public void setTestDate(Date testDate) {
    //        this.testDate = testDate;
    //    }
    //
    //    public Date getTestDate() {
    //        return testDate;
    //    }

    public String getDFileSizeHumanReadable() {
        return dFileSizeHumanReadable;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public String getURL() {
        return URL;
    }


    @Override
    public boolean equals(Object obj) {
        if (this.getdDocName().equalsIgnoreCase(((ContentItem)obj).getdDocName())) {
            return true;
        }
        return false;
    }

    public void setXmDongsukien(String xmDongsukien) {
        this.xmDongsukien = xmDongsukien;
    }

    public String getXmDongsukien() {
        return xmDongsukien;
    }

    public void setDDescription(String dDescription) {
        this.dDescription = dDescription;
    }

    public String getDDescription() {
        return dDescription;
    }

    public void setThumbImageUrl(String thumbImageUrl) {
        this.thumbImageUrl = thumbImageUrl;
    }

    public String getThumbImageUrl() {
        return thumbImageUrl;
    }

    public void setWebImageUrl(String webImageUrl) {
        this.webImageUrl = webImageUrl;
    }

    public String getWebImageUrl() {
        return webImageUrl;
    }

    public int compareTo(ContentItem o) {
        if(this.getXmNgaytao() == null || o.getXmNgaytao() == null) {
            return 0;
        }
        if (this.getXmNgaytao().before(o.getXmNgaytao())) {
            return 0;
        }
        return 1;
    }

    public void setXmXoa(String xmXoa) {
        this.xmXoa = xmXoa;
    }

    public String getXmXoa() {
        return xmXoa;
    }

    public void setXmTengoithau(String xmTengoithau) {
        this.xmTengoithau = xmTengoithau;
    }

    public String getXmTengoithau() {
        return xmTengoithau;
    }

    public void setXmTenbenmoithau(String xmTenbenmoithau) {
        this.xmTenbenmoithau = xmTenbenmoithau;
    }

    public String getXmTenbenmoithau() {
        return xmTenbenmoithau;
    }

    public void setXmDonvi(String xmDonvi) {
        this.xmDonvi = xmDonvi;
    }

    public String getXmDonvi() {
        return xmDonvi;
    }

    public void setXmSolandoc(String xmSolandoc) {
        this.xmSolandoc = xmSolandoc;
    }

    public String getXmSolandoc() {
        return xmSolandoc;
    }

    public void setXmBinhluan(String xmBinhluan) {
        this.xmBinhluan = xmBinhluan;
    }

    public String getXmBinhluan() {
        return xmBinhluan;
    }
}
