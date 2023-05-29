//
//  CharactersDetailView.swift
//  iosApp
//
//  Created by Alexandra Kurganova on 29.05.2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import Kingfisher
import shared

struct CharactersDetailView: View {
    @State var data: Person

    var body: some View {
        VStack{
            ScrollView {
                VStack {
                    header
                    ancestryInfo
                    apperanceInfo
                    wizardInfo
                    actorInfo
                }
            }
        }
    }
    
    var header: some View {
        Group {
            VStack {
                if let url = URL(string: data.image) {
                    generateImage(url: url)
                        .padding(.top, 5)
                } else {
                    EmptyView()
                }
                personName
                    .padding(.bottom, 20)
                mainInfo
                    .padding(.bottom, 5)
                house
            }
        }
        .padding(.bottom, 50)
    }
    
    func generateImage(url: URL) -> some View {
        KFImage(url)
            .placeholder { loader }
            .resizable()
            .frame(width: 190, height: 220)
            .clipped()
            .padding(.horizontal, 16)
    }
    
    var loader: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .padding(.top, 100)
    }
    
    var personName: some View {
        Text(data.name)
            .font(.title2)
            .fontWeight(.light)
    }
    
    var mainInfo: some View {
        HStack {
            Text(data.species)
            setDivider(width: 7)
            if let dateOfBirth = data.dateOfBirth {
                Text(dateOfBirth)
                setDivider(width: 7)
            }
            Text(data.gender)
        }
        .font(.callout)
        .foregroundColor(.gray)
        .padding(.horizontal, 60)
    }
    
    var house: some View {
        Text(data.house)
            .font(.callout)
    }
    
    var ancestryInfo: some View {
        Group {
            infoSection(key:"ancestry", value: data.ancestry)
        }
        .padding(.bottom, 40)
    }
    
    var apperanceInfo: some View {
        Group {
            VStack {
                infoSection(key:"eye color", value: data.eyeColour)
                infoSection(key:"hair color", value: data.hairColour)
            }
        }
        .padding(.bottom, 40)
    }
    
    var wizardInfo: some View {
        Group {
            VStack {
                if data.wand.core.isEmpty, data.wand.wood.isEmpty { EmptyView() } else {
                    makeWandInfo()
                }
                if data.patronus.isEmpty { EmptyView() } else {
                    infoSection(key:"patronus", value: data.patronus)
                }
            }
        }
        .padding(.bottom, 40)
    }
    
    func makeWandInfo() -> some View {
        if let length = data.wand.length, length != 0 {
            return infoSection(key:"wand",
                               value: "core: \(data.wand.core). wood: \(data.wand.wood). length: \(data.wand.length ?? 0)")
        } else {
            return infoSection(key:"wand", value: "core: \(data.wand.core). wood: \(data.wand.wood)")
        }
    }
    
    var actorInfo: some View {
        Group {
            VStack {
                infoSection(key:"actor", value: data.actor)
            }
        }
    }
    
    func infoSection(key: String, value: String) -> some View {
        HStack(spacing: 10) {
            leftInfoSection(key: key)
            setDivider(width: UIScreen.main.bounds.width*0.6)
            rightInfoSection(value: value)
        }
        .padding(.horizontal, 20)
        .padding(.all, 10)
    }
    
    func leftInfoSection(key: String) -> some View {
        Text(key)
            .font(.callout)
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
            .padding(.trailing, 10)
            .frame(maxHeight: .infinity, alignment: .leading)
            .layoutPriority(1)
    }
    
    func setDivider(width: CGFloat) -> some View {
        VStack {
            Divider()
                .frame(maxWidth: width)
        }
    }
    
    func rightInfoSection(value: String) -> some View {
        Text(value)
            .font(.callout)
            .padding(.leading, 10)
            .multilineTextAlignment(.trailing)
            .frame(maxHeight: .infinity, alignment: .trailing)
            .layoutPriority(1)
    }
}
