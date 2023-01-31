OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[7], q[2];
cx q[1], q[2];
cx q[1], q[3];
x q[1];
cx q[6], q[4];
