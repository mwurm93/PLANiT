//  This file was automatically generated and should not be edited.

import Apollo

public struct CreateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(username: String, password: String) {
    graphQLMap = ["username": username, "password": password]
  }

  public init(username: String, password: String, clientMutationId: String?) {
    graphQLMap = ["username": username, "password": password, "clientMutationId": clientMutationId]
  }
}

public final class CreateAUserMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation CreateAUser($newUser: CreateUserInput!) {" +
    "  createUser(input: $newUser) {" +
    "    token" +
    "    changedUser {" +
    "      id" +
    "      username" +
    "      createdAt" +
    "    }" +
    "  }" +
    "}"

  public let newUser: CreateUserInput

  public init(newUser: CreateUserInput) {
    self.newUser = newUser
  }

  public var variables: GraphQLMap? {
    return ["newUser": newUser]
  }

  public struct Data: GraphQLMappable {
    public let createUser: CreateUser?

    public init(reader: GraphQLResultReader) throws {
      createUser = try reader.optionalValue(for: Field(responseName: "createUser"))
    }

    public struct CreateUser: GraphQLMappable {
      public let __typename = "CreateUserPayload"
      public let token: String?
      public let changedUser: ChangedUser?

      public init(reader: GraphQLResultReader) throws {
        token = try reader.optionalValue(for: Field(responseName: "token"))
        changedUser = try reader.optionalValue(for: Field(responseName: "changedUser"))
      }

      public struct ChangedUser: GraphQLMappable {
        public let __typename = "User"
        public let id: GraphQLID
        public let username: String
        public let createdAt: String

        public init(reader: GraphQLResultReader) throws {
          id = try reader.value(for: Field(responseName: "id"))
          username = try reader.value(for: Field(responseName: "username"))
          createdAt = try reader.value(for: Field(responseName: "createdAt"))
        }
      }
    }
  }
}

public final class GetTripQuery: GraphQLQuery {
  public static let operationDefinition =
    "query GetTrip($id: ID!) {" +
    "  getTrip(id: $id) {" +
    "    id" +
    "    name" +
    "    users {" +
    "      edges {" +
    "        cursor" +
    "        node {" +
    "          id" +
    "          username" +
    "        }" +
    "        budget" +
    "      }" +
    "    }" +
    "  }" +
    "}"

  public let id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLMappable {
    public let getTrip: GetTrip?

    public init(reader: GraphQLResultReader) throws {
      getTrip = try reader.optionalValue(for: Field(responseName: "getTrip"))
    }

    public struct GetTrip: GraphQLMappable {
      public let __typename = "Trip"
      public let id: GraphQLID
      public let name: String
      public let users: User?

      public init(reader: GraphQLResultReader) throws {
        id = try reader.value(for: Field(responseName: "id"))
        name = try reader.value(for: Field(responseName: "name"))
        users = try reader.optionalValue(for: Field(responseName: "users"))
      }

      public struct User: GraphQLMappable {
        public let __typename = "TripUsersConnection"
        public let edges: [Edge?]?

        public init(reader: GraphQLResultReader) throws {
          edges = try reader.optionalList(for: Field(responseName: "edges"))
        }

        public struct Edge: GraphQLMappable {
          public let __typename = "TripUsersEdge"
          public let cursor: String
          public let node: Node
          public let budget: Int?

          public init(reader: GraphQLResultReader) throws {
            cursor = try reader.value(for: Field(responseName: "cursor"))
            node = try reader.value(for: Field(responseName: "node"))
            budget = try reader.optionalValue(for: Field(responseName: "budget"))
          }

          public struct Node: GraphQLMappable {
            public let __typename = "User"
            public let id: GraphQLID
            public let username: String

            public init(reader: GraphQLResultReader) throws {
              id = try reader.value(for: Field(responseName: "id"))
              username = try reader.value(for: Field(responseName: "username"))
            }
          }
        }
      }
    }
  }
}