import PlaygroundSupport
import SwiftUI

// MARK:- CardsView


public struct CardsView: View {
    public init(){}
    
    var images = ["bahubali1potrait.jpg","uripotrait.jpg","kgfpotrait.jpg","dangalpotrait.jpg","bahubali2potrait.jpg"]
    
    @State var showContent = false
    @State var toggleValue: Int = 1
    
    
    public var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).edgesIgnoringSafeArea(.all)
                .blur(radius: 0.6)
            
            VStack {
                
                HStack {
                    Text("Movies 🍿")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer()
                    
                    
                    Image(uiImage: #imageLiteral(resourceName: "boxing.jpg"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle()
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.white,Color.blue,Color.red,Color.yellow,Color.purple,Color.red,Color.green,]), startPoint: .topLeading, endPoint: .bottomTrailing),lineWidth: 2)
                            .foregroundColor(Color.primary))
                }.padding()
                
                Divider()
                
                VStack {
                    Text("These five films are most loved by Indians. Each movie has its records at the Box Office. If you are not yet watched give a try. ")
                }.padding()
                
                
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30.0) {
                            ForEach(0..<images.count) { item in
                                Button(action: { self.showContent.toggle()
                                    self.toggleValue = item
                                }) {
                                    GeometryReader { geometry in
                                        
                                        Image(uiImage: UIImage(named: self.images[item])!)
                                            .resizable()
//                                            Using Original Image on Button
                                            .renderingMode(.original)
                                            .cornerRadius(CGFloat(16))
                                            
                                            .rotation3DEffect(Angle(degrees:
                                                Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10.0, z: 0))
                                            .sheet(isPresented: self.$showContent) { MoviesDetailView(value: self.toggleValue)}
                                        
                                    }
                                    .frame(width: 300, height: 500)
                                }
                            }
                        }
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .padding(.bottom, 70)
                    }
                }
                //            card endd
                
                Spacer()
                
            }
        }
        
        
    }
}

// MARK:- ViewExtension


public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

// MARK:- MoviesDetailView


public struct MoviesDetailView: View {
    
    let moviesData = MoviesData
    let value: Int
    
    public var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.3).edgesIgnoringSafeArea(.all)
                .blur(radius: 0.6)
            
            VStack {
                Image(uiImage: UIImage(named: moviesData[value].image)!)
                    .resizable()
                    .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                    .shadow(color: Color.black.opacity(0.22), radius: 10, x: 5, y: 5)
                    .frame(height: UIScreen.main.bounds.height/3)
                
                
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(moviesData[value].title)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                        Text("release date: \(moviesData[value].releaseDate)")
                            .font(.caption)
                            .foregroundColor(.black)
                            .opacity(0.5)
                    }
                    Spacer()
                }.padding()
                
                VStack(alignment: .leading, spacing: 20){
                    
                    Text(moviesData[value].description)
                        .font(.system(size: 16))
                    
                    
                    Text("Budget: \(moviesData[value].budget) Crores")
                        .font(.system(size: 16))
                        .bold()
                    
                    
                    Text("Box Office: \(moviesData[value].boxOffice) Crores")
                        .font(.system(size: 16))
                        .bold()
                    
                }.padding()
                
                Spacer()
            }
            
        }
    }
}

// MARK:- MoviesDataModel

/*
 What is Identifiable Protocol ?
 
 This is one of the protocols built into Swift, and means “this type can be identified uniquely.” It has only one requirement, which is that there must be a property called id that contains a unique identifier. We just added that, so we don’t need to do any extra work – our type conforms to Identifiable just fine.

Now, you might wonder why we added that, because our code was working fine before. Well, because our expense items are now guaranteed to be identifiable uniquely, we no longer need to tell ForEach which property to use for the identifier – it knows there will be an id property and that it will be unique, because that’s the point of the Identifiable protocol.
 
 What is UUID() ?
 
 UUID – short for “universally unique identifier”, and if that doesn’t sound unique I’m not sure what does.

 UUIDs are long hexadecimal strings such as this one: 08B15DB4-2F02-4AB8-A965-67A9C90D8A44. So, that’s eight digits, four digits, four digits, four digits, then twelve digits, of which the only requirement is that there’s a 4 in the first number of the third block. If we subtract the fixed 4, we end up with 31 digits, each of which can be one of 16 values – if we generated 1 UUID every second for a billion years, we might begin to have the slightest chance of generating a duplicate.
 
 */

public struct MoviesDataModel: Identifiable {
    public var id = UUID()
    public var title: String
    public var releaseDate: String
    public var image: String
    public var description: String
    public var budget: Int
    public var boxOffice: Int
}

// MARK:- MoviesData


public let MoviesData = [
    MoviesDataModel(title: "Baahubali: The Beginning", releaseDate: "10 July 2015", image: "bahubali1landscape.jpg", description: "Baahubali: The Beginning is a 2015 Indian epic action film directed by S. S. Rajamouli. The film was produced by Shobu Yarlagadda and Prasad Devineni and was shot in both Telugu and Tamil. This film was also dubbed into Malayalam and Hindi. The film stars Prabhas, Rana Daggubati, Anushka Shetty, and Tamannaah in the lead roles, with Ramya Krishna, Sathyaraj, and Nassar in supporting roles. The first of two cinematic parts, the film follows Shivudu / Shiva, an adventurous young man who helps his love Avanthika rescue Devasena, the former queen of Mahishmati who is now a prisoner under the tyrannical rule of king Bhallaladeva. The story concludes in Baahubali 2: The Conclusion.", budget: 180 , boxOffice: 650),
    
    MoviesDataModel(title: "Uri: The Surgical Strike", releaseDate: "11 January 2019", image: "urilandscape.jpg", description: "Uri: The Surgical Strike is a 2019 Indian Hindi-language military action film. It is directed and written by debutante Aditya Dhar. Produced by Ronnie Screwvala, the film stars Vicky Kaushal, Paresh Rawal, Yami Gautam, Mohit Raina and Kirti Kulhari in lead roles. The plot is a dramatised account of the retaliation to the 2016 Uri attack, following Major Vihaan Singh Shergill of the Indian Army, who plays a leading role in the events. The film was released on 11 January 2019 and grossed ₹342.06 crore (US$53 million) worldwide. It has received generally positive reviews from critics and ranks among the highest-grossing Indian films. The film has been a recipient of various accolades.", budget: 25, boxOffice: 342),
    
    MoviesDataModel(title: "K.G.F: Chapter 1", releaseDate: "21 December 2018", image: "kgflandscape.jpg", description: "K.G.F: Chapter 1 is a 2018 Indian Kannada-language period action film[6][7] written and directed by Prashanth Neel, and produced by Vijay Kiragandur under the banner Hombale films. It is the first instalment in the two-part series, followed by K.G.F: Chapter 2. The film centres around Raja Krishnappa Bairya Rocky, born into poverty, who arrives in Bombay (now Mumbai) in the 1960s, on a quest for power and wealth as desired by his dying mother. Involved with the gold mafia there, he is recruited to kill Garuda, the oppressive heir-in-waiting, in Kolar Gold Fields. Yash stars as Rocky, while debutante Ramachandra Raju features as Garuda. Anant Nag narrates the film while also playing a supporting role alongside Srinidhi Shetty, Vasishta N. Simha, Ayyappa P. Sharma and Harish Rai. At the 66th National Film Awards, the film won 2 awards for Best Action and Best Special Effects.[8]", budget: 80, boxOffice: 250),
    
    
    MoviesDataModel(title: "Dangal", releaseDate: "3 December 2016", image: "dangallandscape.jpg", description: "Dangal (transl. 'Wrestling competition') is a 2016 Indian Hindi-language biographical sports drama film, directed by Nitesh Tiwari and produced by Aamir Khan, under his studio Aamir Khan Productions with UTV Motion Pictures and Walt Disney Pictures India. Loosely based on the Phogat family, Aamir Khan stars as Mahavir Singh Phogat, a pehlwani amateur wrestler who trains his daughters Geeta Phogat and Babita Kumari to become India's first world-class female wrestlers.[9] Fatima Sana Shaikh and Sanya Malhotra portray the adult versions of the two Phogat sisters, Zaira Wasim and Suhani Bhatnagar their younger versions, Sakshi Tanwar their mother, and Aparshakti Khurana their cousin." , budget: 70, boxOffice: 2100 ),
    
    
    MoviesDataModel(title: "Baahubali 2: The Conclusion", releaseDate: "28 April 2017", image: "bahubali2landscape.png", description: "Baahubali 2: The Conclusion is a 2017 Indian epic action film directed by S. S. Rajamouli and written by his father K. V. Vijayendra Prasad. It was produced by Shobu Yarlagadda and Prasad Devineni under the banner Arka Media Works. Released on 28 April 2017, the film stars Prabhas, Rana Daggubati, Anushka Shetty and Tamannaah while Ramya Krishna, Sathyaraj, Nassar, and Subbaraju appear in prominent roles. The second cinematic part in the Baahubali franchise, it is the follow-up to Baahubali: The Beginning, serving as both a sequel and a prequel.[6] The film is set in medieval India and follows the sibling rivalry between Amarendra Baahubali and Bhallaladeva; the latter conspires against the former and has him killed by Kattappa. Years later, Amarendra's son returns to avenge his death. The Conclusion was made simultaneously in Telugu and Tamil and later dubbed into Hindi, Malayalam, Japanese, Russian and Chinese.", budget: 250, boxOffice: 1810),
    
    
    
    
    
    
]

// MARK:- RoundedCorner


struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

