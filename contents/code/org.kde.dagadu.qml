// -*- coding: iso-8859-1 -*-
/*
 *   Author: Sarwo Hadi Setyana <sh.setyana@gmail.com>
 *   Date: Thu Mar 7 2013, 07:33:35
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 1.1
import org.kde.plasma.components 0.1 as PlasmaComponents
import "plasmapackage:/scripts/dagadu.js" as Matamu

Item {
    id: root
    
    property string version: "1.0"
    property int minimumWidth: 200
    property int minimumHeight: 300
    
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        
        PlasmaComponents.Label {
            id: titleLabel
            text: i18n("<h3>..:: Dagadu Generator ::..</h3>")
            anchors.horizontalCenter: parent.horizontalCenter
        }
            
        PlasmaComponents.TextArea {
            id: textOriginal
            placeholderText: i18n("Original / Dagadu")    
            anchors {
                top: titleLabel.bottom
                left: parent.left
                right: parent.right
                
                topMargin: 5
                leftMargin: 5
                rightMargin: 5
            }
            
            height: parent.height * 0.36
        }
        
        PlasmaComponents.Button {
            id: buttonDagadu
            text: i18n("Dagadu-kan")
            
            anchors {
                top: textOriginal.bottom
                left: parent.left
                right: parent.right
                
                topMargin: 5
                leftMargin: 5
                rightMargin: 5
            }
            
            onClicked: {
                console.log("Dagadu Generator", version, "\n> originalText: ", textOriginal.text, "\n> dagaduText: ", Matamu.dagaduString(textOriginal.text))
                
                textDagadu.text = Matamu.dagaduString(textOriginal.text)
            }
        }
        
        PlasmaComponents.TextArea {
            id: textDagadu
            placeholderText: i18n("Dagadu / Original")
            readOnly: true
            
            anchors {
                top: buttonDagadu.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                
                topMargin: 5
                leftMargin: 5
                rightMargin: 5
                bottomMargin: 5
            }
        }
        
        Component.onCompleted: {
            plasmoid.popupicon = "gwenview"
        }
    }
}