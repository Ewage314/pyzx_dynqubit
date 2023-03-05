OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[1];
cx q[6], q[8];
cx q[12], q[2];
cx q[17], q[4];
cx q[18], q[13];
