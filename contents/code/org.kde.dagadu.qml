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

Item {
    id: root
    
    property string version: "1.0"
    property int minimumWidth: 200
    property int minimumHeight: 300
    
    Column {
        anchors.fill: parent
        
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
            }
            
            height: parent.height * 0.39
        }
        
        PlasmaComponents.Button {
            id: buttonDagadu
            text: i18n("Dagadu-kan")
            
            anchors {
                top: textOriginal.bottom
                left: parent.left
                right: parent.right
                
                topMargin: 5
            }
            
            onClicked: {
                console.log("Dagadu Generator", version, "\n> originalText: ", textOriginal.text, "\n> dagaduText: ", dagaduString(textOriginal.text))
                
                textDagadu.text = dagaduString(textOriginal.text)
            }
        }
        
        PlasmaComponents.TextArea {
            id: textDagadu
            placeholderText: i18n("Dagadu / Original")
            
            anchors {
                top: buttonDagadu.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                
                topMargin: 5
            }
        }
    }
    
    /*
     *  function dagaduString(aString) and dagaduChar(c)
     *  created by Pakdhe Lantip (http://twitter.com/lantip)
     */
    
    function dagaduString(aString) {
        var last = aString.length;
        var result = "";
        for (var i = 0; i < last ; i++) {
            var tesdua = 'n';
            var siji = '';
            var loro = '';
            var balik = '';
            var ojonambah = 'n';

            siji = aString.charAt(i);
            if(i == 0) {
                if(siji == 'a') {
                    balik = 'pa';
                    tesdua = 'y';
                    ojonambah = 'y';
                }
                if(siji == 'e') {
                    balik = 'pe';
                    tesdua = 'y';
                    ojonambah = 'y';
                }
                if(siji == 'i') {
                    balik = 'pi';
                    tesdua = 'y';
                    ojonambah = 'y';
                }
                if(siji == 'o') {
                    balik = 'po';
                    tesdua = 'y';
                    ojonambah = 'y';
                }
                if(siji == 'u') {
                    balik = 'pu';
                    tesdua = 'y';
                    ojonambah = 'y';
                }
                if(siji == 'p') {
                    balik = '';
                    tesdua = 'y';
                    ojonambah = 'y';
                }
            }

            if(i < last-1) {
                loro = aString.charAt(i+1);
                if(siji == 'n' && loro == 'y') {
                    balik = 'k';
                    tesdua = 'y';
                }
                if(siji == 'n' && loro == 'g') {
                    balik = 'l';
                    tesdua = 'y';
                }
                if(siji == 'd' && loro == 'h') {
                    balik = 'n';
                    tesdua = 'y';
                }
                if(siji == 't' && loro == 'h') {
                    balik = 'w';
                    tesdua = 'y';
                }
            }

            if(i == last-1) {
                if(siji == 't'){
                    balik = 'n';
                    tesdua = 'y';
                }
            }

            if(tesdua == 'y') {
                result += balik;
                if(ojonambah == 'n')
                    i++;
            }
            else result += dagaduChar(aString.charAt(i))
        }
        
        return result;
    }

    function dagaduChar(c) {
        if (c == 'a') {
            return 'a'
        }
        else if (c == 'ng') {
            return 'l'
        }
        else if (c == 'dh') {
            return 'n'
        }
        else if (c == 'th') {
            return 'w'
        }
        else if (c == 'ny') {
            return 'k'
        }
        else if (c == 'b') {
            return 's'
        }
        else if (c == 'c') {
            return 'j' 
        }
        else if (c == 'd') {
            return 'm'
        }
        else if (c == 'e') {
            return 'e'
        }
        else if (c == 'f') {
            return 'h' 
        }
        else if (c == 'g') {
            return 't'
        }
        else if (c == 'h') {
            return 'p'
        }
        else if (c == 'i') {
            return 'i'
        }
        else if (c == 'j') {
            return 'c'
        }
        else if (c == 'k') {
            return 'ny'
        }
        else if (c == 'l') {
            return 'ng'
        }
        else if (c == 'm') {
            return 'd'
        }
        else if (c == 'n') {
            return 'dh'
        }
        else if (c == 'o') {
            return 'o'
        }
        else if (c == 'p') {
            return 'h'
        }
        else if (c == 'q') {
            return 's'
        }
        else if (c == 'r') {
            return 'y'
        }
        else if (c == 's') {
            return 'b'
        }
        else if (c == 't') {
            return 'g'
        }
        else if (c == 'u') {
            return 'u'
        }
        else if (c == 'v') {
            return 'h'
        }
        else if (c == 'w') {
            return 'th'
        }
        else if (c == 'x') {
            return 'x'
        }
        else if (c == 'y') {
            return 'r'
        }
        else if (c == 'z') {
            return 'z'
        }
        
        return c;
    }
}