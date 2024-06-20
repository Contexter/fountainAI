import Vapor
import MIDIKit

struct GenerateMIDIFileRequest: Content {
    let fileName: String
    let events: [MIDIEvent]
}

func generateMIDIFile(req: Request) throws -> EventLoopFuture<Response> {
    let params = try req.content.decode(GenerateMIDIFileRequest.self)
    var midi = MIDIFile()
    var track = MIDIFileTrack()

    for event in params.events {
        switch event.type {
        case .noteOn:
            let noteOn = MIDIEvent.noteOn(
                event.note,
                velocity: .unitInterval(Double(event.velocity) / 127.0),
                channel: event.channel,
                group: 0
            )
            track.events.append(.noteOn(noteOn))
        case .noteOff:
            let noteOff = MIDIEvent.noteOff(
                event.note,
                velocity: .unitInterval(Double(event.velocity) / 127.0),
                channel: event.channel,
                group: 0
            )
            track.events.append(.noteOff(noteOff))
        case .programChange:
            let programChange = MIDIEvent.programChange(
                event.program,
                channel: event.channel,
                group: 0
            )
            track.events.append(.programChange(programChange))
        default:
            break
        }
    }

    midi.tracks.append(track)
    try midi.write(to: URL(fileURLWithPath: "output/\(params.fileName)"))

    return req.eventLoop.makeSucceededFuture(Response(status: .ok))
}
