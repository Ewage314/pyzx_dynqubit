OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[1], q[3];
cx q[6], q[2];
cx q[6], q[4];
x q[5];
cx q[6], q[1];
