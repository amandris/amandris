/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50024
Source Host           : localhost:3306
Source Database       : amandris

Target Server Type    : MYSQL
Target Server Version : 50024
File Encoding         : 65001

Date: 2011-07-08 10:56:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `albumelement`
-- ----------------------------
DROP TABLE IF EXISTS `albumelement`;
CREATE TABLE `albumelement` (
  `id` int(11) unsigned NOT NULL default '0',
  `sellerId` int(11) unsigned NOT NULL default '0',
  `mediaTypeConst` int(11) unsigned NOT NULL default '0',
  `code` int(11) unsigned NOT NULL default '0',
  `text` varchar(256) default NULL,
  `views` int(11) unsigned NOT NULL default '0',
  `votes` int(11) unsigned NOT NULL default '0',
  `active` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------
-- Table structure for `amandrismessage`
-- ----------------------------
DROP TABLE IF EXISTS `amandrismessage`;
CREATE TABLE `amandrismessage` (
  `id` int(11) NOT NULL default '0',
  `userId` int(11) unsigned default NULL,
  `userType` int(11) unsigned NOT NULL default '0',
  `date` timestamp NOT NULL default '1971-01-01 00:00:00',
  `subject` varchar(256) NOT NULL,
  `text` text NOT NULL,
  `email` varchar(256) NOT NULL,
  `isNew` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `buyer`
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `id` int(11) unsigned NOT NULL default '0',
  `sexConst` int(11) unsigned NOT NULL default '0',
  `countryId` int(11) unsigned NOT NULL default '0',
  `stateId` int(11) NOT NULL default '0',
  `login` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `active` int(11) unsigned NOT NULL default '0',
  `textActive` int(11) unsigned NOT NULL default '0',
  `credits` int(11) unsigned NOT NULL default '0',
  `name` varchar(64) default NULL,
  `surname` varchar(64) default NULL,
  `email` varchar(256) NOT NULL,
  `birthdate` date NOT NULL default '0000-00-00',
  `city` varchar(256) NOT NULL,
  `address1` varchar(256) default NULL,
  `address2` varchar(256) default NULL,
  `postalCode` varchar(11) NOT NULL default '0',
  `sendBulletin` int(11) unsigned NOT NULL default '0',
  `sendNews` int(11) unsigned NOT NULL default '0',
  `isPublic` int(11) unsigned NOT NULL default '0',
  `activationCode` varchar(32) NOT NULL,
  `views` int(11) unsigned NOT NULL default '0',
  `intro` varchar(256) NOT NULL,
  `text` text NOT NULL,
  `preferredSexConst` int(11) unsigned NOT NULL default '0',
  `preferredAgeLow` int(11) unsigned NOT NULL default '0',
  `preferredAgeHigh` int(11) unsigned NOT NULL default '0',
  `preferredPhysiqueConst` int(11) unsigned NOT NULL default '0',
  `preferredSmokerConst` int(11) unsigned NOT NULL default '0',
  `preferredSkinColorConst` int(11) unsigned NOT NULL default '0',
  `preferredHairColorConst` int(11) unsigned NOT NULL default '0',
  `preferredHairLengthConst` int(11) unsigned NOT NULL default '0',
  `preferredBreastSizeConst` int(11) unsigned NOT NULL default '0',
  `preferredPennisSizeConst` int(11) unsigned NOT NULL default '0',
  `preferredEducationLevelConst` int(11) unsigned NOT NULL default '0',
  `preferredHeightConst` int(11) unsigned NOT NULL default '0',
  `preferredEyeColorConst` int(11) unsigned NOT NULL default '0',
  `preferredOrientationConst` int(11) unsigned NOT NULL default '0',
  `preferredLanguageConst` int(11) unsigned NOT NULL default '0',
  `preferredText` text,
  `preferredOriginConst` int(11) unsigned NOT NULL default '0',
  `heightConst` int(11) unsigned NOT NULL default '0',
  `physiqueConst` int(11) unsigned NOT NULL default '0',
  `originConst` int(11) unsigned NOT NULL default '0',
  `smokerConst` int(11) unsigned NOT NULL default '0',
  `language1Const` int(11) unsigned NOT NULL default '0',
  `language2Const` int(11) unsigned NOT NULL default '0',
  `language3Const` int(11) unsigned NOT NULL default '0',
  `orientationConst` int(11) unsigned NOT NULL default '0',
  `educationLevelConst` int(11) unsigned NOT NULL default '0',
  `skinColorConst` int(11) unsigned NOT NULL default '0',
  `eyeColorConst` int(11) unsigned NOT NULL default '0',
  `hairColorConst` int(11) unsigned NOT NULL default '0',
  `hairLengthConst` int(11) unsigned NOT NULL default '0',
  `breastSizeConst` int(11) unsigned NOT NULL default '0',
  `pennisSizeConst` int(11) unsigned NOT NULL default '0',
  `paypalAccount` varchar(256) default NULL,
  `phoneNumberSMS` varchar(64) default NULL,
  `phoneNumberCall` varchar(64) default NULL,
  `skypeAccount` varchar(64) default NULL,
  `picture1` int(11) unsigned NOT NULL default '0',
  `picture2` int(11) unsigned NOT NULL default '0',
  `picture3` int(11) unsigned NOT NULL default '0',
  `picture4` int(11) unsigned NOT NULL default '0',
  `picture5` int(11) unsigned NOT NULL default '0',
  `picture1Waiting` int(11) unsigned NOT NULL default '0',
  `picture2Waiting` int(11) unsigned NOT NULL default '0',
  `picture3Waiting` int(11) unsigned NOT NULL default '0',
  `picture4Waiting` int(11) unsigned NOT NULL default '0',
  `picture5Waiting` int(11) unsigned NOT NULL default '0',
  `mainPicture` int(11) unsigned NOT NULL default '0',
  `mainPictureCode` int(11) unsigned NOT NULL default '0',
  `lastLogin` timestamp NOT NULL default '0000-00-00 00:00:00',
  `isOnLine` int(11) unsigned NOT NULL default '0',
  `hasPicture` int(11) unsigned NOT NULL default '0',
  `contactsSent` int(11) unsigned NOT NULL default '0',
  `contactsAccepted` int(11) unsigned NOT NULL default '0',
  `contactsRejected` int(11) unsigned NOT NULL default '0',
  `contactsNotReplied` int(11) unsigned NOT NULL default '0',
  `datesCanceled` int(11) unsigned NOT NULL default '0',
  `positiveVotes` int(11) unsigned NOT NULL default '0',
  `negativeVotes` int(11) unsigned NOT NULL default '0',
  `preferencesSaved` int(11) unsigned NOT NULL default '0',
  `picturesSaved` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `buyerhistoriccredit`
-- ----------------------------
DROP TABLE IF EXISTS `buyerhistoriccredit`;
CREATE TABLE `buyerhistoriccredit` (
  `id` int(11) unsigned NOT NULL default '0',
  `buyerId` int(11) unsigned NOT NULL default '0',
  `creditActionConst` int(11) unsigned NOT NULL default '0',
  `credits` int(11) unsigned NOT NULL default '0',
  `result` int(11) NOT NULL default '0',
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- ----------------------------
-- Table structure for `buyerhistoriclogin`
-- ----------------------------
DROP TABLE IF EXISTS `buyerhistoriclogin`;
CREATE TABLE `buyerhistoriclogin` (
  `id` int(11) unsigned NOT NULL default '0',
  `buyerId` int(11) unsigned NOT NULL default '0',
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `isLogin` int(11) unsigned NOT NULL default '0' COMMENT 'Value=1 if it is Login. Value=0 otherwise',
  `ipAddress` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `buyermessage`
-- ----------------------------
DROP TABLE IF EXISTS `buyermessage`;
CREATE TABLE `buyermessage` (
  `id` int(11) unsigned NOT NULL default '0',
  `buyerId` int(11) unsigned NOT NULL default '0',
  `sender` varchar(64) NOT NULL,
  `active` int(11) unsigned NOT NULL default '0',
  `subject` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `isHtml` int(11) unsigned NOT NULL default '0',
  `isNew` int(11) unsigned NOT NULL default '0',
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `buyerrecomendation`
-- ----------------------------
DROP TABLE IF EXISTS `buyerrecomendation`;
CREATE TABLE `buyerrecomendation` (
  `id` int(11) unsigned NOT NULL default '0',
  `buyerId` int(11) unsigned NOT NULL default '0',
  `email` varchar(256) NOT NULL,
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `used` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `buyersavedsearch`
-- ----------------------------
DROP TABLE IF EXISTS `buyersavedsearch`;
CREATE TABLE `buyersavedsearch` (
  `id` int(11) unsigned NOT NULL default '0',
  `buyerId` int(11) unsigned NOT NULL default '0',
  `name` varchar(256) NOT NULL,
  `mySexConst` int(11) unsigned NOT NULL default '0',
  `sexConst` int(11) unsigned default '0',
  `countryId` int(11) unsigned NOT NULL default '0',
  `stateId` int(11) unsigned default '0',
  `ageLow` int(11) unsigned NOT NULL default '0',
  `agehigh` int(11) unsigned NOT NULL default '0',
  `serviceConst` int(11) unsigned NOT NULL default '0',
  `servicePricesHigh` varchar(64) default NULL,
  `physiqueConst` int(11) unsigned NOT NULL default '0',
  `smokerConst` int(11) unsigned NOT NULL default '0',
  `skinColorConst` int(11) unsigned NOT NULL default '0',
  `hairColorConst` int(11) unsigned NOT NULL default '0',
  `hairLengthConst` int(11) unsigned default NULL,
  `breastSizeConst` int(11) unsigned NOT NULL default '0',
  `pennisSizeConst` int(11) unsigned NOT NULL default '0',
  `educationLevelConst` int(11) unsigned NOT NULL default '0',
  `heightConst` int(11) unsigned NOT NULL default '0',
  `eyeColorConst` int(11) unsigned NOT NULL default '0',
  `orientationConst` int(11) unsigned NOT NULL default '0',
  `languageConst` int(11) unsigned NOT NULL default '0',
  `originConst` int(11) unsigned NOT NULL default '0',
  `hasAlbum` int(11) unsigned NOT NULL default '0',
  `hasFreeContact` int(11) unsigned NOT NULL default '0',
  `isOnLine` int(11) unsigned NOT NULL default '0',
  `orderedBy` varchar(255) default NULL,
  `itemsPerPage` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `calendar`
-- ----------------------------
DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
  `id` int(11) unsigned NOT NULL default '0',
  `sellerId` int(11) unsigned NOT NULL default '0',
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `hourStatusConst` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(11) unsigned NOT NULL default '0',
  `buyerId` int(11) unsigned NOT NULL default '0',
  `sellerId` int(11) unsigned NOT NULL default '0',
  `serviceTypeConst` int(11) unsigned NOT NULL default '0',
  `sellerActive` int(11) unsigned NOT NULL default '0',
  `buyerActive` int(11) unsigned NOT NULL default '0',
  `price` double(11,2) unsigned NOT NULL default '0.00',
  `currencyConst` int(11) unsigned NOT NULL default '0',
  `contactDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  `dateDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  `messageStatusConst` int(11) unsigned NOT NULL default '0',
  `paymentStatusConst` int(11) unsigned NOT NULL default '0',
  `buyerMadePayment` int(11) unsigned NOT NULL default '0',
  `dateStatusConst` int(11) unsigned NOT NULL default '0',
  `voteStatusConst` int(11) unsigned NOT NULL default '0',
  `sellerVoteStatusConst` int(11) unsigned NOT NULL default '0',
  `vote` int(11) default '0',
  `sellerVote` int(11) default '0',
  `messageAnswer` varchar(256) default NULL,
  `cancelDateText` varchar(256) default NULL,
  `city` varchar(256) NOT NULL,
  `address1` varchar(256) default NULL,
  `address2` varchar(256) default NULL,
  `postalCode` varchar(11) default NULL,
  `length` int(11) unsigned default NULL,
  `state` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `contactmessage`
-- ----------------------------
DROP TABLE IF EXISTS `contactmessage`;
CREATE TABLE `contactmessage` (
  `id` int(11) unsigned NOT NULL default '0',
  `contactId` int(11) unsigned NOT NULL default '0',
  `text` text NOT NULL,
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `sentFromBuyer` int(11) unsigned NOT NULL default '0' COMMENT 'Value=1 if it is from buyer to seller. Value=0 otherwise.',
  `isNew` int(11) unsigned NOT NULL default '0' COMMENT 'Value=1 if it new. Value=1 if already read.',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(11) unsigned NOT NULL default '0',
  `text` varchar(256) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('0', 'na');
INSERT INTO `country` VALUES ('14', 'andorra');
INSERT INTO `country` VALUES ('20', 'argentina');
INSERT INTO `country` VALUES ('48', 'colombia');
INSERT INTO `country` VALUES ('53', 'costaRica');
INSERT INTO `country` VALUES ('55', 'cuba');
INSERT INTO `country` VALUES ('57', 'chile');
INSERT INTO `country` VALUES ('62', 'dominica');
INSERT INTO `country` VALUES ('63', 'ecuador');
INSERT INTO `country` VALUES ('70', 'spain');
INSERT INTO `country` VALUES ('82', 'gibraltar');
INSERT INTO `country` VALUES ('85', 'guadeloupe');
INSERT INTO `country` VALUES ('86', 'guatemala');
INSERT INTO `country` VALUES ('91', 'haiti');
INSERT INTO `country` VALUES ('93', 'honduras');
INSERT INTO `country` VALUES ('136', 'mexico');
INSERT INTO `country` VALUES ('143', 'nicaragua');
INSERT INTO `country` VALUES ('150', 'panama');
INSERT INTO `country` VALUES ('151', 'paraguay');
INSERT INTO `country` VALUES ('152', 'peru');
INSERT INTO `country` VALUES ('160', 'dominicanRepublic');
INSERT INTO `country` VALUES ('193', 'uruguay');
INSERT INTO `country` VALUES ('195', 'venezuela');

-- ----------------------------
-- Table structure for `invitation`
-- ----------------------------
DROP TABLE IF EXISTS `invitation`;
CREATE TABLE `invitation` (
  `id` int(11) unsigned NOT NULL default '0',
  `buyerId` int(11) unsigned NOT NULL default '0',
  `sellerId` varchar(64) NOT NULL,
  `buyerVisible` int(11) unsigned NOT NULL default '0',
  `sellerVisible` int(11) unsigned NOT NULL default '0',
  `text` text COMMENT 'Predefined static texts',
  `isFreeContact` int(11) unsigned NOT NULL default '0',
  `freeContactUsed` int(11) unsigned NOT NULL default '0',
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `expirationDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `ojb_dlist`
-- ----------------------------
DROP TABLE IF EXISTS `ojb_dlist`;
CREATE TABLE `ojb_dlist` (
  `ID` int(11) NOT NULL,
  `SIZE_` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `ojb_dlist_entries`
-- ----------------------------
DROP TABLE IF EXISTS `ojb_dlist_entries`;
CREATE TABLE `ojb_dlist_entries` (
  `ID` int(11) NOT NULL,
  `DLIST_ID` int(11) default NULL,
  `POSITION_` int(11) default NULL,
  `OID_` longblob,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `ojb_dmap`
-- ----------------------------
DROP TABLE IF EXISTS `ojb_dmap`;
CREATE TABLE `ojb_dmap` (
  `ID` int(11) NOT NULL,
  `SIZE_` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `ojb_dmap_entries`
-- ----------------------------
DROP TABLE IF EXISTS `ojb_dmap_entries`;
CREATE TABLE `ojb_dmap_entries` (
  `ID` int(11) NOT NULL,
  `DMAP_ID` int(11) NOT NULL,
  `KEY_OID` longblob,
  `VALUE_OID` longblob,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `ojb_dset`
-- ----------------------------
DROP TABLE IF EXISTS `ojb_dset`;
CREATE TABLE `ojb_dset` (
  `ID` int(11) NOT NULL,
  `SIZE_` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `ojb_dset_entries`
-- ----------------------------
DROP TABLE IF EXISTS `ojb_dset_entries`;
CREATE TABLE `ojb_dset_entries` (
  `ID` int(11) NOT NULL,
  `DLIST_ID` int(11) default NULL,
  `POSITION_` int(11) default NULL,
  `OID_` longblob,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `ojb_hl_seq`
-- ----------------------------
DROP TABLE IF EXISTS `ojb_hl_seq`;
CREATE TABLE `ojb_hl_seq` (
  `TABLENAME` varchar(175) NOT NULL,
  `FIELDNAME` varchar(70) NOT NULL,
  `MAX_KEY` int(11) default NULL,
  `GRAB_SIZE` int(11) default NULL,
  `VERSION` int(11) default NULL,
  PRIMARY KEY  (`TABLENAME`,`FIELDNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ojb_hl_seq
-- ----------------------------
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_albumelement', 'deprecatedColumn', '40', '20', '2');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_amandrismessage', 'deprecatedColumn', '720', '20', '36');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_buyer', 'deprecatedColumn', '2082', '20', '104');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_buyerhistoriccredit', 'deprecatedColumn', '1060', '20', '53');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_buyerhistoriclogin', 'deprecatedColumn', '6720', '20', '336');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_buyermessage', 'deprecatedColumn', '940', '20', '47');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_buyerrecomendation', 'deprecatedColumn', '120', '20', '6');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_buyersavedsearch', 'deprecatedColumn', '220', '20', '11');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_calendar', 'deprecatedColumn', '7085440', '20', '354272');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_contact', 'deprecatedColumn', '860', '20', '43');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_contactmessage', 'deprecatedColumn', '1040', '20', '52');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_invitation', 'deprecatedColumn', '1000', '20', '50');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_seller', 'deprecatedColumn', '1900', '20', '95');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_sellerhistoriccredit', 'deprecatedColumn', '1120', '20', '56');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_sellerhistoriclogin', 'deprecatedColumn', '6060', '20', '303');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_sellermessage', 'deprecatedColumn', '1020', '20', '51');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_sellerpromotion', 'deprecatedColumn', '750', '20', '32');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_sellerrecomendation', 'deprecatedColumn', '240', '20', '12');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_sellerservice', 'deprecatedColumn', '2200', '20', '110');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_votetobuyer', 'deprecatedColumn', '240', '20', '12');
INSERT INTO `ojb_hl_seq` VALUES ('SEQ_votetoseller', 'deprecatedColumn', '320', '20', '16');

-- ----------------------------
-- Table structure for `ojb_lockentry`
-- ----------------------------
DROP TABLE IF EXISTS `ojb_lockentry`;
CREATE TABLE `ojb_lockentry` (
  `OID_` varchar(250) NOT NULL,
  `TX_ID` varchar(50) NOT NULL,
  `TIMESTAMP_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ISOLATIONLEVEL` int(11) default NULL,
  `LOCKTYPE` int(11) default NULL,
  PRIMARY KEY  (`OID_`,`TX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `ojb_nrm`
-- ----------------------------
DROP TABLE IF EXISTS `ojb_nrm`;
CREATE TABLE `ojb_nrm` (
  `NAME` varchar(250) NOT NULL,
  `OID_` longblob,
  PRIMARY KEY  (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

----------------------------

-- ----------------------------
-- Table structure for `ojb_seq`
-- ----------------------------
DROP TABLE IF EXISTS `ojb_seq`;
CREATE TABLE `ojb_seq` (
  `TABLENAME` varchar(175) NOT NULL,
  `FIELDNAME` varchar(70) NOT NULL,
  `LAST_NUM` int(11) default NULL,
  PRIMARY KEY  (`TABLENAME`,`FIELDNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

---------------------------

-- ----------------------------
-- Table structure for `seller`
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `id` int(11) unsigned NOT NULL default '0',
  `sexConst` int(11) unsigned NOT NULL default '0',
  `countryId` int(11) unsigned NOT NULL default '0',
  `stateId` int(11) NOT NULL default '0',
  `login` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `active` int(11) unsigned NOT NULL default '0',
  `textActive` int(11) unsigned NOT NULL default '0',
  `credits` int(11) unsigned NOT NULL default '0',
  `name` varchar(64) default NULL,
  `surname` varchar(64) default NULL,
  `email` varchar(256) NOT NULL,
  `birthdate` date NOT NULL default '0000-00-00',
  `address1` varchar(256) default NULL,
  `address2` varchar(256) default NULL,
  `city` varchar(256) NOT NULL,
  `hasMeetingPlace` int(11) unsigned NOT NULL default '0',
  `meetingCountry` varchar(256) default NULL,
  `meetingState` varchar(256) default NULL,
  `meetingAddress1` varchar(256) default NULL,
  `meetingAddress2` varchar(256) default NULL,
  `meetingCity` varchar(256) default NULL,
  `meetingPostalCode` varchar(256) default NULL,
  `postalCode` varchar(11) NOT NULL default '0',
  `googleMapsUrl` varchar(512) default NULL,
  `sendNews` int(11) unsigned NOT NULL default '0',
  `defaultCurrency` int(11) unsigned NOT NULL default '0',
  `calendarPattern` int(11) unsigned NOT NULL default '0',
  `activationCode` varchar(32) NOT NULL,
  `views` int(11) default NULL,
  `intro` varchar(256) NOT NULL,
  `text` text NOT NULL,
  `preferredSexConst` int(11) unsigned NOT NULL default '0',
  `preferredAgeLow` int(11) unsigned NOT NULL default '0',
  `preferredAgeHigh` int(11) unsigned NOT NULL default '0',
  `preferredPhysiqueConst` int(11) unsigned NOT NULL default '0',
  `preferredSmokerConst` int(11) unsigned NOT NULL default '0',
  `preferredSkinColorConst` int(11) unsigned NOT NULL default '0',
  `preferredHairColorConst` int(11) unsigned NOT NULL default '0',
  `preferredHairLengthConst` int(11) unsigned NOT NULL default '0',
  `preferredBreastSizeConst` int(11) unsigned NOT NULL default '0',
  `preferredPennisSizeConst` int(11) unsigned NOT NULL default '0',
  `preferredEducationLevelConst` int(11) unsigned NOT NULL default '0',
  `preferredHeightConst` int(11) unsigned NOT NULL default '0',
  `preferredEyeColorConst` int(11) unsigned NOT NULL default '0',
  `preferredOrientationConst` int(11) unsigned NOT NULL default '0',
  `preferredLanguageConst` int(11) unsigned NOT NULL default '0',
  `preferredText` text,
  `preferredOriginConst` int(11) unsigned NOT NULL default '0',
  `heightConst` int(11) unsigned NOT NULL default '0',
  `physiqueConst` int(11) unsigned NOT NULL default '0',
  `originConst` int(11) unsigned NOT NULL default '0',
  `smokerConst` int(11) unsigned NOT NULL default '0',
  `language1Const` int(11) unsigned NOT NULL default '0',
  `language2Const` int(11) unsigned NOT NULL default '0',
  `language3Const` int(11) unsigned NOT NULL default '0',
  `orientationConst` int(11) unsigned NOT NULL default '0',
  `educationLevelConst` int(11) unsigned NOT NULL default '0',
  `skinColorConst` int(11) unsigned NOT NULL default '0',
  `eyeColorConst` int(11) unsigned NOT NULL default '0',
  `hairColorConst` int(11) unsigned NOT NULL default '0',
  `hairLengthConst` int(11) unsigned NOT NULL default '0',
  `breastSizeConst` int(11) unsigned NOT NULL default '0',
  `pennisSizeConst` int(11) unsigned NOT NULL default '0',
  `oralSex` int(11) unsigned NOT NULL default '0',
  `analSex` int(11) unsigned NOT NULL default '0',
  `bdsm` int(11) unsigned NOT NULL default '0',
  `inSellerHouse` int(11) unsigned NOT NULL default '0',
  `inBuyerHouse` int(11) unsigned NOT NULL default '0',
  `inHotel` int(11) unsigned NOT NULL default '0',
  `inCar` int(11) unsigned NOT NULL default '0',
  `buyerPaysDisplacement` int(11) unsigned NOT NULL default '0' COMMENT 'Value=1 if seller pays displacement. Value=0 otherwise',
  `displacementPrize` double unsigned default NULL,
  `paypalAccount` varchar(256) default NULL,
  `phoneNumberSMS` varchar(64) default NULL,
  `phoneNumberCall` varchar(64) default NULL,
  `url` varchar(1024) default NULL,
  `skypeAccount` varchar(64) default NULL,
  `messengerAccount` varchar(255) default NULL,
  `bankAccount` varchar(64) default NULL,
  `paymentBeforeDate` int(11) unsigned NOT NULL default '0',
  `allowSms` int(11) unsigned NOT NULL default '0',
  `allowPhoneCall` int(11) unsigned NOT NULL default '0',
  `allowUrl` int(11) unsigned NOT NULL default '0',
  `allowSkype` int(11) unsigned NOT NULL default '0',
  `allowMessenger` int(11) unsigned NOT NULL default '0',
  `allowEmail` int(11) unsigned NOT NULL default '0',
  `allowPaypalPayment` int(11) unsigned NOT NULL default '0',
  `allowBankPayment` int(11) unsigned NOT NULL default '0',
  `picture1` int(11) unsigned NOT NULL default '0',
  `picture2` int(11) unsigned NOT NULL default '0',
  `picture3` int(11) unsigned NOT NULL default '0',
  `picture4` int(11) unsigned NOT NULL default '0',
  `picture5` int(11) unsigned NOT NULL default '0',
  `picture1Waiting` int(11) unsigned NOT NULL default '0',
  `picture2Waiting` int(11) unsigned NOT NULL default '0',
  `picture3Waiting` int(11) unsigned NOT NULL default '0',
  `picture4Waiting` int(11) unsigned NOT NULL default '0',
  `picture5Waiting` int(11) unsigned NOT NULL default '0',
  `mainPicture` int(11) unsigned NOT NULL default '0',
  `mainPictureCode` int(11) unsigned NOT NULL default '0',
  `hasAlbum` int(11) unsigned NOT NULL default '0',
  `hasPicture` int(11) unsigned NOT NULL default '0',
  `lastLogin` timestamp NOT NULL default '0000-00-00 00:00:00',
  `isOnLine` int(11) unsigned NOT NULL default '0',
  `isCalendarGenerated` int(11) unsigned NOT NULL default '0',
  `contactsReceived` int(11) unsigned NOT NULL default '0',
  `contactsAccepted` int(11) unsigned NOT NULL default '0',
  `contactsRejected` int(11) unsigned NOT NULL default '0',
  `contactsNotReplied` int(11) unsigned NOT NULL default '0',
  `replyDelayInSeconds` int(11) unsigned NOT NULL default '0',
  `datesCanceled` int(11) unsigned NOT NULL default '0',
  `positiveVotes` int(11) unsigned NOT NULL default '0',
  `negativeVotes` int(11) unsigned NOT NULL default '0',
  `freeContactsUntil` timestamp NULL default NULL,
  `firstPlaceInSearchUntil` timestamp NULL default NULL,
  `servicesSaved` int(11) unsigned NOT NULL default '0',
  `parametersSaved` int(11) unsigned NOT NULL default '0',
  `preferencesSaved` int(11) unsigned NOT NULL default '0',
  `picturesSaved` int(11) unsigned NOT NULL default '0',
  `calendarPatternStartHour` int(11) default NULL,
  `calendarPatternStartDay` int(11) default NULL,
  `calendarPatternEndDay` int(11) default NULL,
  `calendarPatternEndHour` int(11) default NULL,
  `isEscort` int(11) unsigned NOT NULL default '0',
  `subscriptionUntil` timestamp NULL default NULL,
  `promoCode` varchar(64) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `sellerhistoriccredit`
-- ----------------------------
DROP TABLE IF EXISTS `sellerhistoriccredit`;
CREATE TABLE `sellerhistoriccredit` (
  `id` int(11) unsigned NOT NULL default '0',
  `sellerId` int(11) unsigned NOT NULL default '0',
  `creditActionConst` int(11) unsigned NOT NULL default '0',
  `credits` int(11) unsigned NOT NULL default '0',
  `result` int(11) unsigned NOT NULL default '0',
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `sellerhistoriclogin`
-- ----------------------------
DROP TABLE IF EXISTS `sellerhistoriclogin`;
CREATE TABLE `sellerhistoriclogin` (
  `id` int(11) unsigned NOT NULL default '0',
  `sellerId` int(11) unsigned NOT NULL default '0',
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `isLogin` int(11) unsigned NOT NULL default '0' COMMENT 'Value=1 if it is Login. Value=0 otherwise',
  `ipAddress` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `sellermessage`
-- ----------------------------
DROP TABLE IF EXISTS `sellermessage`;
CREATE TABLE `sellermessage` (
  `id` int(11) unsigned NOT NULL default '0',
  `sellerId` int(11) unsigned NOT NULL default '0',
  `sender` varchar(64) NOT NULL,
  `active` int(11) unsigned NOT NULL default '0',
  `subject` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `isHtml` int(11) unsigned NOT NULL default '0',
  `isNew` int(11) unsigned NOT NULL default '0',
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `sellerpromotion`
-- ----------------------------
DROP TABLE IF EXISTS `sellerpromotion`;
CREATE TABLE `sellerpromotion` (
  `id` int(11) unsigned NOT NULL default '0',
  `sellerId` int(11) unsigned NOT NULL default '0',
  `promotionConst` int(11) unsigned NOT NULL default '0',
  `startDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  `endDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `sellerrecomendation`
-- ----------------------------
DROP TABLE IF EXISTS `sellerrecomendation`;
CREATE TABLE `sellerrecomendation` (
  `id` int(11) unsigned NOT NULL default '0',
  `sellerId` int(11) unsigned NOT NULL default '0',
  `email` varchar(256) NOT NULL,
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `used` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for `sellerservice`
-- ----------------------------
DROP TABLE IF EXISTS `sellerservice`;
CREATE TABLE `sellerservice` (
  `id` int(11) unsigned NOT NULL default '0',
  `sellerId` int(11) unsigned NOT NULL default '0',
  `serviceTypeConst` int(11) unsigned NOT NULL default '0',
  `sexConst` int(11) unsigned NOT NULL default '0',
  `serviceFirstHourPrice` double(11,2) unsigned NOT NULL default '0.00',
  `serviceAdditionalHoursPrice` double(11,2) unsigned NOT NULL default '0.00',
  `currencyConst` int(11) unsigned NOT NULL default '0',
  `toAsk` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `state`
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id` int(11) unsigned NOT NULL default '0',
  `text` varchar(256) NOT NULL,
  `countryId` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of state
-- ----------------------------
INSERT INTO `state` VALUES ('0', 'na', '0');
INSERT INTO `state` VALUES ('23', 'andalucia', '70');
INSERT INTO `state` VALUES ('24', 'aragon', '70');
INSERT INTO `state` VALUES ('25', 'asturias', '70');
INSERT INTO `state` VALUES ('26', 'baleares', '70');
INSERT INTO `state` VALUES ('27', 'canarias', '70');
INSERT INTO `state` VALUES ('28', 'cantabria', '70');
INSERT INTO `state` VALUES ('29', 'castillaLaMancha', '70');
INSERT INTO `state` VALUES ('30', 'castillaLeon', '70');
INSERT INTO `state` VALUES ('31', 'cataluna', '70');
INSERT INTO `state` VALUES ('32', 'comunidadvalenciana', '70');
INSERT INTO `state` VALUES ('33', 'extremadura', '70');
INSERT INTO `state` VALUES ('34', 'galicia', '70');
INSERT INTO `state` VALUES ('35', 'laRioja', '70');
INSERT INTO `state` VALUES ('36', 'madrid', '70');
INSERT INTO `state` VALUES ('37', 'murcia', '70');
INSERT INTO `state` VALUES ('38', 'navarra', '70');
INSERT INTO `state` VALUES ('39', 'paisVasco', '70');
INSERT INTO `state` VALUES ('65', 'amazonas', '195');
INSERT INTO `state` VALUES ('66', 'anzoategui', '195');
INSERT INTO `state` VALUES ('67', 'apure', '195');
INSERT INTO `state` VALUES ('68', 'aragua', '195');
INSERT INTO `state` VALUES ('69', 'barinas', '195');
INSERT INTO `state` VALUES ('70', 'bolivar', '195');
INSERT INTO `state` VALUES ('71', 'carabobo', '195');
INSERT INTO `state` VALUES ('72', 'cojedes', '195');
INSERT INTO `state` VALUES ('73', 'deltaAmacuro', '195');
INSERT INTO `state` VALUES ('74', 'dependenciasFederales', '195');
INSERT INTO `state` VALUES ('75', 'distritoFederal', '195');
INSERT INTO `state` VALUES ('76', 'falcon', '195');
INSERT INTO `state` VALUES ('77', 'guarico', '195');
INSERT INTO `state` VALUES ('78', 'lara', '195');
INSERT INTO `state` VALUES ('79', 'merida', '195');
INSERT INTO `state` VALUES ('80', 'miranda', '195');
INSERT INTO `state` VALUES ('81', 'monagas', '195');
INSERT INTO `state` VALUES ('82', 'nuevaEsparta', '195');
INSERT INTO `state` VALUES ('83', 'portuguesa', '195');
INSERT INTO `state` VALUES ('84', 'sucre', '195');
INSERT INTO `state` VALUES ('85', 'tachira', '195');
INSERT INTO `state` VALUES ('86', 'trujillo', '195');
INSERT INTO `state` VALUES ('87', 'vargas', '195');
INSERT INTO `state` VALUES ('88', 'yaracuy', '195');
INSERT INTO `state` VALUES ('89', 'zulia', '195');
INSERT INTO `state` VALUES ('354', 'amazonas', '152');
INSERT INTO `state` VALUES ('355', 'ancash', '152');
INSERT INTO `state` VALUES ('356', 'apurimac', '152');
INSERT INTO `state` VALUES ('357', 'arequipa', '152');
INSERT INTO `state` VALUES ('358', 'ayacucho', '152');
INSERT INTO `state` VALUES ('359', 'cajamarca', '152');
INSERT INTO `state` VALUES ('360', 'callao', '152');
INSERT INTO `state` VALUES ('361', 'cusco', '152');
INSERT INTO `state` VALUES ('362', 'huancavelica', '152');
INSERT INTO `state` VALUES ('363', 'huanuco', '152');
INSERT INTO `state` VALUES ('364', 'ica', '152');
INSERT INTO `state` VALUES ('365', 'junin', '152');
INSERT INTO `state` VALUES ('366', 'laLibertad', '152');
INSERT INTO `state` VALUES ('367', 'lambayeque', '152');
INSERT INTO `state` VALUES ('368', 'lima', '152');
INSERT INTO `state` VALUES ('369', 'loreto', '152');
INSERT INTO `state` VALUES ('370', 'madreDeDios', '152');
INSERT INTO `state` VALUES ('371', 'moquegua', '152');
INSERT INTO `state` VALUES ('372', 'pasco', '152');
INSERT INTO `state` VALUES ('373', 'piura', '152');
INSERT INTO `state` VALUES ('374', 'puno', '152');
INSERT INTO `state` VALUES ('375', 'sanMartin', '152');
INSERT INTO `state` VALUES ('376', 'tacna', '152');
INSERT INTO `state` VALUES ('377', 'tumbes', '152');
INSERT INTO `state` VALUES ('378', 'ucayali', '152');
INSERT INTO `state` VALUES ('379', 'bocasDelToro', '150');
INSERT INTO `state` VALUES ('380', 'chiriqui', '150');
INSERT INTO `state` VALUES ('381', 'cocle', '150');
INSERT INTO `state` VALUES ('382', 'colon', '150');
INSERT INTO `state` VALUES ('383', 'darien', '150');
INSERT INTO `state` VALUES ('384', 'embera', '150');
INSERT INTO `state` VALUES ('385', 'herrera', '150');
INSERT INTO `state` VALUES ('386', 'kunaDeMadungandi', '150');
INSERT INTO `state` VALUES ('387', 'kunaDeWargandi', '150');
INSERT INTO `state` VALUES ('388', 'sanBlas', '150');
INSERT INTO `state` VALUES ('389', 'losSantos', '150');
INSERT INTO `state` VALUES ('390', 'ngobeBugle', '150');
INSERT INTO `state` VALUES ('391', 'panama', '150');
INSERT INTO `state` VALUES ('392', 'veraguas', '150');
INSERT INTO `state` VALUES ('393', 'aguascalientes', '136');
INSERT INTO `state` VALUES ('394', 'bajaCaliforniaNorte', '136');
INSERT INTO `state` VALUES ('395', 'bajaCaliforniaSur', '136');
INSERT INTO `state` VALUES ('396', 'campeche', '136');
INSERT INTO `state` VALUES ('397', 'chiapas', '136');
INSERT INTO `state` VALUES ('398', 'chihuahua', '136');
INSERT INTO `state` VALUES ('399', 'coahuilaDeZaragoza', '136');
INSERT INTO `state` VALUES ('400', 'colima', '136');
INSERT INTO `state` VALUES ('401', 'distritoFederal', '136');
INSERT INTO `state` VALUES ('402', 'durango', '136');
INSERT INTO `state` VALUES ('403', 'estadoDeMexico', '136');
INSERT INTO `state` VALUES ('404', 'guanajuato', '136');
INSERT INTO `state` VALUES ('405', 'guerrero', '136');
INSERT INTO `state` VALUES ('406', 'hidalgo', '136');
INSERT INTO `state` VALUES ('407', 'jalisco', '136');
INSERT INTO `state` VALUES ('408', 'michoacan', '136');
INSERT INTO `state` VALUES ('409', 'morelos', '136');
INSERT INTO `state` VALUES ('410', 'nayarit', '136');
INSERT INTO `state` VALUES ('411', 'nuevoLeon', '136');
INSERT INTO `state` VALUES ('412', 'oaxaca', '136');
INSERT INTO `state` VALUES ('413', 'puebla', '136');
INSERT INTO `state` VALUES ('414', 'queretaro', '136');
INSERT INTO `state` VALUES ('415', 'quintanaRoo', '136');
INSERT INTO `state` VALUES ('416', 'sanLuisPotosi', '136');
INSERT INTO `state` VALUES ('417', 'sinaloa', '136');
INSERT INTO `state` VALUES ('418', 'sonora', '136');
INSERT INTO `state` VALUES ('419', 'tabasco', '136');
INSERT INTO `state` VALUES ('420', 'tamaulipas', '136');
INSERT INTO `state` VALUES ('421', 'tlaxcala', '136');
INSERT INTO `state` VALUES ('422', 'veracruz', '136');
INSERT INTO `state` VALUES ('423', 'yucatan', '136');
INSERT INTO `state` VALUES ('424', 'zacatecas', '136');
INSERT INTO `state` VALUES ('543', 'atlantida', '93');
INSERT INTO `state` VALUES ('544', 'choluteca', '93');
INSERT INTO `state` VALUES ('545', 'colon', '93');
INSERT INTO `state` VALUES ('546', 'comayagua', '93');
INSERT INTO `state` VALUES ('547', 'copan', '93');
INSERT INTO `state` VALUES ('548', 'cortes', '93');
INSERT INTO `state` VALUES ('549', 'elParaiso', '93');
INSERT INTO `state` VALUES ('550', 'franciscoMorazan', '93');
INSERT INTO `state` VALUES ('551', 'graciasADios', '93');
INSERT INTO `state` VALUES ('552', 'intibuca', '93');
INSERT INTO `state` VALUES ('553', 'islasDeLaBahia', '93');
INSERT INTO `state` VALUES ('554', 'laPaz', '93');
INSERT INTO `state` VALUES ('555', 'lempira', '93');
INSERT INTO `state` VALUES ('556', 'ocotepeque', '93');
INSERT INTO `state` VALUES ('557', 'olancho', '93');
INSERT INTO `state` VALUES ('558', 'santaBarbara', '93');
INSERT INTO `state` VALUES ('559', 'valle', '93');
INSERT INTO `state` VALUES ('560', 'yoro', '93');
INSERT INTO `state` VALUES ('561', 'altaVerapaz', '86');
INSERT INTO `state` VALUES ('562', 'bajaVerapaz', '86');
INSERT INTO `state` VALUES ('563', 'chimaltenango', '86');
INSERT INTO `state` VALUES ('564', 'chiquimula', '86');
INSERT INTO `state` VALUES ('565', 'elProgreso', '86');
INSERT INTO `state` VALUES ('566', 'escuintla', '86');
INSERT INTO `state` VALUES ('567', 'guatemala', '86');
INSERT INTO `state` VALUES ('568', 'huehuetenango', '86');
INSERT INTO `state` VALUES ('569', 'izabal', '86');
INSERT INTO `state` VALUES ('570', 'jalapa', '86');
INSERT INTO `state` VALUES ('571', 'jutiapa', '86');
INSERT INTO `state` VALUES ('572', 'peten', '86');
INSERT INTO `state` VALUES ('573', 'quetzaltenango', '86');
INSERT INTO `state` VALUES ('574', 'quiche', '86');
INSERT INTO `state` VALUES ('575', 'retalhuleu', '86');
INSERT INTO `state` VALUES ('576', 'sacatepequez', '86');
INSERT INTO `state` VALUES ('577', 'sanMarcos', '86');
INSERT INTO `state` VALUES ('578', 'santaRosa', '86');
INSERT INTO `state` VALUES ('579', 'solola', '86');
INSERT INTO `state` VALUES ('580', 'suchitepequez', '86');
INSERT INTO `state` VALUES ('581', 'totonicapan', '86');
INSERT INTO `state` VALUES ('582', 'zacapa', '86');
INSERT INTO `state` VALUES ('630', 'camaguey', '55');
INSERT INTO `state` VALUES ('631', 'ciegoDeAvila', '55');
INSERT INTO `state` VALUES ('632', 'cienfuegos', '55');
INSERT INTO `state` VALUES ('633', 'ciudadDeLaHabana', '55');
INSERT INTO `state` VALUES ('634', 'granma', '55');
INSERT INTO `state` VALUES ('635', 'guantanamo', '55');
INSERT INTO `state` VALUES ('636', 'holguin', '55');
INSERT INTO `state` VALUES ('637', 'islaDeLaJuventud', '55');
INSERT INTO `state` VALUES ('638', 'laHabana', '55');
INSERT INTO `state` VALUES ('639', 'lasTunas', '55');
INSERT INTO `state` VALUES ('640', 'matanzas', '55');
INSERT INTO `state` VALUES ('641', 'pinarDelRio', '55');
INSERT INTO `state` VALUES ('642', 'santiagoDeCuba', '55');
INSERT INTO `state` VALUES ('643', 'sanctiSpiritus', '55');
INSERT INTO `state` VALUES ('644', 'sillaClara', '55');
INSERT INTO `state` VALUES ('645', 'amazonas', '48');
INSERT INTO `state` VALUES ('646', 'antioquia', '48');
INSERT INTO `state` VALUES ('647', 'arauca', '48');
INSERT INTO `state` VALUES ('648', 'atlantico', '48');
INSERT INTO `state` VALUES ('649', 'boyaca', '48');
INSERT INTO `state` VALUES ('650', 'bolivar', '48');
INSERT INTO `state` VALUES ('651', 'caldas', '48');
INSERT INTO `state` VALUES ('652', 'caqueta', '48');
INSERT INTO `state` VALUES ('653', 'casanare', '48');
INSERT INTO `state` VALUES ('654', 'cauca', '48');
INSERT INTO `state` VALUES ('655', 'cesar', '48');
INSERT INTO `state` VALUES ('656', 'choco', '48');
INSERT INTO `state` VALUES ('657', 'cordoba', '48');
INSERT INTO `state` VALUES ('658', 'cundinamarca', '48');
INSERT INTO `state` VALUES ('659', 'distritoCapitalDeBogota', '48');
INSERT INTO `state` VALUES ('660', 'guainia', '48');
INSERT INTO `state` VALUES ('661', 'guaviare', '48');
INSERT INTO `state` VALUES ('662', 'huila', '48');
INSERT INTO `state` VALUES ('663', 'laGuajira', '48');
INSERT INTO `state` VALUES ('664', 'magdalena', '48');
INSERT INTO `state` VALUES ('665', 'meta', '48');
INSERT INTO `state` VALUES ('666', 'narino', '48');
INSERT INTO `state` VALUES ('667', 'norteDeSantander', '48');
INSERT INTO `state` VALUES ('668', 'putumayo', '48');
INSERT INTO `state` VALUES ('669', 'quindio', '48');
INSERT INTO `state` VALUES ('670', 'risaralda', '48');
INSERT INTO `state` VALUES ('671', 'sanAndresYProvidencia', '48');
INSERT INTO `state` VALUES ('672', 'santander', '48');
INSERT INTO `state` VALUES ('673', 'sucre', '48');
INSERT INTO `state` VALUES ('674', 'tolima', '48');
INSERT INTO `state` VALUES ('675', 'valleDelCauca', '48');
INSERT INTO `state` VALUES ('676', 'vaupes', '48');
INSERT INTO `state` VALUES ('677', 'vichada', '48');
INSERT INTO `state` VALUES ('710', 'aisen', '57');
INSERT INTO `state` VALUES ('711', 'antofagasta', '57');
INSERT INTO `state` VALUES ('712', 'araucania', '57');
INSERT INTO `state` VALUES ('713', 'atacama', '57');
INSERT INTO `state` VALUES ('714', 'bioBio', '57');
INSERT INTO `state` VALUES ('715', 'coquimbo', '57');
INSERT INTO `state` VALUES ('716', 'bernardoOHiggins', '57');
INSERT INTO `state` VALUES ('717', 'losLagos', '57');
INSERT INTO `state` VALUES ('718', 'magallanes', '57');
INSERT INTO `state` VALUES ('719', 'maule', '57');
INSERT INTO `state` VALUES ('720', 'regionMetropolitana', '57');
INSERT INTO `state` VALUES ('721', 'tarapaca', '57');
INSERT INTO `state` VALUES ('722', 'valparaiso', '57');
INSERT INTO `state` VALUES ('789', 'buenosAires', '20');
INSERT INTO `state` VALUES ('790', 'catamarca', '20');
INSERT INTO `state` VALUES ('791', 'chaco', '20');
INSERT INTO `state` VALUES ('792', 'chubut', '20');
INSERT INTO `state` VALUES ('793', 'cordoba', '20');
INSERT INTO `state` VALUES ('794', 'corrientes', '20');
INSERT INTO `state` VALUES ('795', 'distritoFederal', '20');
INSERT INTO `state` VALUES ('796', 'entreRios', '20');
INSERT INTO `state` VALUES ('797', 'formosa', '20');
INSERT INTO `state` VALUES ('798', 'jujuy', '20');
INSERT INTO `state` VALUES ('799', 'laPampa', '20');
INSERT INTO `state` VALUES ('800', 'laRioja', '20');
INSERT INTO `state` VALUES ('801', 'mendoza', '20');
INSERT INTO `state` VALUES ('802', 'misiones', '20');
INSERT INTO `state` VALUES ('803', 'neuquen', '20');
INSERT INTO `state` VALUES ('804', 'rioNegro', '20');
INSERT INTO `state` VALUES ('805', 'salta', '20');
INSERT INTO `state` VALUES ('806', 'sanJuan', '20');
INSERT INTO `state` VALUES ('807', 'sanLuis', '20');
INSERT INTO `state` VALUES ('808', 'santaCruz', '20');
INSERT INTO `state` VALUES ('809', 'santaFe', '20');
INSERT INTO `state` VALUES ('810', 'santiagoDelEstero', '20');
INSERT INTO `state` VALUES ('811', 'tierraDelFuego', '20');
INSERT INTO `state` VALUES ('812', 'tucuman', '20');

-- ----------------------------
-- Table structure for `votetobuyer`
-- ----------------------------
DROP TABLE IF EXISTS `votetobuyer`;
CREATE TABLE `votetobuyer` (
  `id` int(11) unsigned NOT NULL default '0',
  `sellerId` int(11) unsigned NOT NULL default '0',
  `buyerId` int(11) unsigned NOT NULL default '0',
  `contactId` int(11) unsigned NOT NULL default '0',
  `active` int(11) unsigned NOT NULL default '0',
  `vote` int(11) NOT NULL default '0',
  `comment` varchar(256) NOT NULL,
  `reply` varchar(256) default NULL,
  `replyActive` int(11) unsigned NOT NULL default '0',
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `votetoseller`
-- ----------------------------
DROP TABLE IF EXISTS `votetoseller`;
CREATE TABLE `votetoseller` (
  `id` int(11) unsigned NOT NULL default '0',
  `buyerId` int(11) unsigned NOT NULL default '0',
  `sellerId` int(11) unsigned NOT NULL default '0',
  `contactId` int(11) unsigned NOT NULL default '0',
  `active` int(11) unsigned NOT NULL default '0',
  `vote` int(11) NOT NULL default '0',
  `comment` varchar(256) NOT NULL,
  `reply` varchar(256) default NULL,
  `replyActive` int(11) unsigned NOT NULL default '0',
  `date` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

