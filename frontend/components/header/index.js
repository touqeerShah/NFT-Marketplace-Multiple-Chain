import React from "react";
import { Button, Col, Row, Container } from "@nextui-org/react";
import { createTheme, NextUIProvider } from "@nextui-org/react";
import "sf-font";
import Link from "next/link";
export default function Header() {
  return (
    <div>
      <div style={{ background: "black" }}>
        <Container lg css={{ marginTop: "$5" }}>
          <Row justify="center">
            <Col css={{ marginTop: "$8" }}>
              <img style={{ width: "220px" }} src="logo.png" />
            </Col>

            <Col css={{ marginTop: "$8", paddingTop: "10px" }}>
              <Link href="/">
                <Button
                  size="sm"
                  style={{
                    background: "#00000070",
                    boxShadow: "0px 0px 4px #ffffff",
                  }}
                >
                  <a
                    style={{
                      fontFamily: "SF Pro Display",
                      fontWeight: "500",
                      color: "white",
                      fontSize: "20px",
                    }}
                  >
                    MarketPlace
                  </a>
                </Button>
              </Link>
            </Col>
            <Col css={{ marginTop: "$8", paddingTop: "10px" }}>
              <Link href="/collections">
                <Button
                  size="sm"
                  style={{
                    background: "#00000070",
                    boxShadow: "0px 0px 4px #ffffff",
                  }}
                >
                  <a
                    style={{
                      fontFamily: "SF Pro Display",
                      fontWeight: "500",
                      color: "white",
                      fontSize: "20px",
                    }}
                  >
                    Collections
                  </a>
                </Button>
              </Link>
            </Col>
            <Col css={{ marginTop: "$8", paddingTop: "10px" }}>
              <Button
                size="sm"
                style={{
                  background: "#00000070",
                  boxShadow: "0px 0px 4px #ffffff",
                }}
              >
                <Link href="/portal">
                  <a
                    style={{
                      fontFamily: "SF Pro Display",
                      fontWeight: "500",
                      color: "white",
                      fontSize: "20px",
                    }}
                  >
                    My NFT Portal
                  </a>
                </Link>
              </Button>
            </Col>
          </Row>
        </Container>
      </div>
    </div>
  );
}
